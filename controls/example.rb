# copyright: 2018, The Authors

title "sample section"

# you can also use plain tests
describe file("/tmp") do
  it { should be_directory }
end

# you add controls here
control "tmp-1.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Create /tmp directory"             # A human-readable title
  desc "An optional description..."
  describe file("/tmp") do                  # The actual test
    it { should be_directory }
  end
end

include_controls 'DevSec Linux Baseline' do
  control 'package-08' do
    describe auditd_conf do
      its('max_log_file_action') { should cmp 'ROTATE' }
    end
  end
end
include_controls 'DevSec SSH Baseline'
include_controls 'CIS Docker Benchmark'
# include_controls 'DevSec Nginx Baseline'
# include_controls 'DevSec PostgreSQL Baseline'
