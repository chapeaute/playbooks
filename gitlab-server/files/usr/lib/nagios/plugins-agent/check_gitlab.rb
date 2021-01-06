#!/opt/gitlab/embedded/bin/ruby
# frozen_string_literal: true

#
# Gitlab Plugin
# ==
# Author: Marco Peterseil
# Created: 03-2017
# License: GPLv3 - http://www.gnu.org/licenses
# URL: https://gitlab.com/6uellerBpanda/check_gitlab
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

require 'optparse'
require 'net/https'
require 'json'
require 'date'

version = 'v0.4.0'

# optparser
banner = <<~HEREDOC
  check_gitlab #{version} [https://gitlab.com/6uellerBpanda/check_gitlab]\n
  This plugin checks various parameters of Gitlab\n
  Mode:
    health                    Check the Gitlab web endpoint for health
    services                  Check if any service of 'gitlab-ctl status' is down
    group_size                Check size of group in MB
    ci-pipeline               Check duration of a CI pipeline
    ci-runner                 Check status of CI runners
    ci-runner-jobs-duration   Check duration (in seconds) of running jobs of CI runners
    license-expires           Check remaining days when license expires - only warning status possible
    license-overage           Check if more active then licensed users are present

  Usage: #{File.basename(__FILE__)} [options]
HEREDOC

options = {}
OptionParser.new do |opts| # rubocop:disable  Metrics/BlockLength
  opts.banner = banner.to_s
  opts.separator ''
  opts.separator 'Options:'
  opts.on('-s', '--address ADDRESS', 'Gitlab address') do |s|
    options[:address] = s
  end
  opts.on('-t', '--token TOKEN', 'Access token') do |t|
    options[:token] = t
  end
  opts.on('-i', '--id ID', 'Project/Group/CI-Runner ID') do |i|
    options[:id] = i
  end
  opts.on('-k', '--insecure', 'No ssl verification') do |k|
    options[:insecure] = k
  end
  opts.on('-m', '--mode MODE', 'Mode to check') do |m|
    options[:mode] = m
  end
  opts.on('-n', '--name NAME', 'Name of group') do |n|
    options[:name] = n
  end
  opts.on('-e', '--exclude EXCLUDE', 'Exclude group') do |e|
    options[:exclude] = e
  end
  opts.on('-w', '--warning WARNING', 'Warning threshold') do |w|
    options[:warning] = w
  end
  opts.on('-c', '--critical CRITICAL', 'Critical threshold') do |c|
    options[:critical] = c
  end
  opts.on('-d', '--debug', 'Print extra debugging/status output (available for health check)') do |d|
    options[:debug] = d
  end
  opts.on('-v', '--version', 'Print version information') do
    puts "check_gitlab #{version}"
  end
  opts.on('-h', '--help', 'Show this help message') do
    puts opts
  end
  ARGV.push('-h') if ARGV.empty?
end.parse!

# check args for api calls
unless options[:mode] == 'services' || ARGV.empty?
  raise OptionParser::MissingArgument if options[:address].nil? || options[:token].nil?
end

# check gitlab
class CheckGitlab
  def initialize(options)
    @options = options
    init_arr
    health_check
    ci_pipeline_check
    ci_runner_check
    ci_runner_jobs_duration
    services_check
    group_size
    license_expire
    license_overage
  end

  #--------#
  # HELPER #
  #--------#

  def init_arr
    @perfdata = []
    @message = []
    @critical = []
    @warning = []
    @okays = []
  end

  # define some helper methods for naemon
  def ok_msg(message)
    puts "OK - #{message}" + @debug.to_s
    exit 0
  end

  def crit_msg(message)
    puts "Critical - #{message}" + @debug.to_s
    exit 2
  end

  def warn_msg(message)
    puts "Warning - #{message}" + @debug.to_s
    exit 1
  end

  def unk_msg(message)
    puts "Unknown - #{message}"
    exit 3
  end

  # convert the bytes
  def convert_to_mb(data:)
    @used_size = data.to_i / 1024 / 1024
  end

  # debug output
  def debug(data:)
    @debug = data.map { |k, v| "\n#{k} is #{v['status']}" }.join
  end

  def build_perfdata(perfdata:)
    @perfdata << "#{perfdata};#{@options[:warning]};#{@options[:critical]}"
  end

  # build service output
  def build_output(msg:)
    @message = msg
  end

  # helper for threshold checking
  def check_thresholds(data:)
    if data > @options[:critical].to_i
      @critical << @message
    elsif data > @options[:warning].to_i
      @warning << @message
    else
      @okays << @message
    end
    # make the final step
    build_final_output
  end

  # mix everything together for exit
  def build_final_output
    perf_output = " | #{@perfdata.join(' ')}"
    if @critical.any?
      crit_msg(@critical.join(', ') + perf_output)
    elsif @warning.any?
      warn_msg(@warning.join(', ') + perf_output)
    else
      ok_msg(@okays.join(', ') + perf_output)
    end
  end

  #----------#
  # API AUTH #
  #----------#

  # create url
  def url(path:)
    uri = URI("#{@options[:address]}/#{path}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE if @options[:insecure]
    request = Net::HTTP::Get.new(uri.request_uri)
    request.add_field 'PRIVATE-TOKEN', @options[:token] if @options[:mode] != 'health'
    @response = http.request(request)
  rescue StandardError => e
    unk_msg(e)
  end

  # init http req
  def http_connect(path:)
    url(path: path)
    check_http_response
  end

  # check http response
  def check_http_response
    unk_msg(@response.message).to_s if @response.code != '200'
  end

  #--------#
  # CHECKS #
  #--------#

  ### HEALTH CHECK
  def health_check
    return unless @options[:mode] == 'health'
    http_connect(path: '-/readiness')
    data_json = JSON.parse(@response.body)
    unhealthy_probes = data_json.reject { |_k, v| v['status'] == 'ok' }
    debug(data: data_json) if @options[:debug]
    if unhealthy_probes.empty?
      ok_msg('Gitlab probes are in healthy state')
    else
      warn_msg(unhealthy_probes.map { |k, _v| k }.join(', ') + ' probe has problems')
    end
  end

  ### CI-PIPELINE DURATION CHECK
  def ci_pipeline_check
    return unless @options[:mode] == 'ci-pipeline'
    http_connect(path: "api/v4/projects/#{@options[:id]}/pipelines?scope=finished")
    # get latest pipeline
    http_connect(path: "api/v4/projects/#{@options[:id]}/pipelines/#{JSON.parse(@response.body).first['id']}")
    ci_pipeline_data = JSON.parse(@response.body)
    build_output(msg: "Pipeline ##{ci_pipeline_data['id']} took #{ci_pipeline_data['duration']}s")
    build_perfdata(perfdata: "duration=#{ci_pipeline_data['duration']}s")
    check_thresholds(data: ci_pipeline_data['duration'])
  end

  ### CI-RUNNER CHECK
  def ci_runner_check
    return unless @options[:mode] == 'ci-runner'
    http_connect(path: 'api/v4/runners/all')
    runners = JSON.parse(@response.body)
    unactive_runners, active_runners = runners.partition { |item| item['active'] == false }
    build_output(msg: "#{active_runners.count} runner active" + ", #{unactive_runners.count} runner not active")
    build_perfdata(perfdata: "unactive_runners=#{unactive_runners.count}")
    check_thresholds(data: unactive_runners.count)
  end

  ### CI-RUNNER JOBS DURATION
  def ci_runner_jobs_duration
    return unless @options[:mode] == 'ci-runner-jobs-duration'
    http_connect(path: "api/v4/runners/#{@options[:id]}/jobs?status=running")
    jobs = JSON.parse(@response.body).first
    if @response.content_length < 3
      ok_msg('No running jobs')
    else
      build_output(msg: "#{jobs['name']} is running for #{jobs['duration'].round}s")
      build_perfdata(perfdata: "duration=#{jobs['duration'].round}s")
      check_thresholds(data: jobs['duration'])
    end
  end

  ### SERVICES CHECK
  # check if sudoers entry with 'gitlab-ctl' command is present for current user
  def gitlab_ctl_sudoers_check
    `sudo -ln gitlab-ctl 2>/dev/null`
    unk_msg('No sudoers entry found for gitlab-ctl command') unless $?.success? # rubocop:disable Style/SpecialGlobalVars
  rescue StandardError => e
    unk_msg(e)
  end

  # get all services with down status
  def gitlab_ctl_status
    `sudo gitlab-ctl status`.scan(/(?:down: )(\w+)/)
  rescue StandardError => e
    unk_msg(e)
  end

  def services_check
    return unless @options[:mode] == 'services'
    gitlab_ctl_sudoers_check
    if gitlab_ctl_status.any?
      down_srvc = gitlab_ctl_status.join(', ')
      crit_msg("#{down_srvc} is down")
    else
      ok_msg('All services are running')
    end
  end

  ### GROUP SIZE
  def group_size
    return unless @options[:mode] == 'group_size'
    http_connect(path: "api/v4/groups?statistics=true&search=#{@options[:name]}&skip_groups=#{@options[:exclude]}")
    data = JSON.parse(@response.body).first
    convert_to_mb(data: data['statistics']['storage_size'])
    build_output(msg: "#{data['name']}: used space #{@used_size}MB")
    build_perfdata(perfdata: "#{data['name']}=#{@used_size}MB")
    check_thresholds(data: @used_size)
  end

  ### LICENSE
  def license_expire
    return unless @options[:mode] == 'license-expire'
    http_connect(path: 'api/v4/license')
    due_date = JSON.parse(@response.body)['expires_at']
    expire = Date.parse(due_date) - Date.today
    if expire.to_i > @options[:warning].to_i
      ok_msg("License  will expire at #{due_date} - #{expire.to_i} days left")
    else
      warn_msg("License  will expire at #{due_date} - #{expire.to_i} days left")
    end
  end

  def license_overage
    return unless @options[:mode] == 'license-overage'
    http_connect(path: 'api/v4/license')
    data = JSON.parse(@response.body)
    build_output(msg: "Active users: #{data['active_users']}, Overage: #{data['overage']}")
    build_perfdata(perfdata: "active_users=#{data['active_users']} overage=#{data['overage']}")
    check_thresholds(data: data['overage'])
  end
end

CheckGitlab.new(options)
