node.validate! do
  {
    sshd: {
      port: integer,
    }
  }
end

username = 'pi'
homedir = "/home/#{username}"

directory "#{homedir}/.ssh" do
  action :create
  group username
  owner username
end

execute 'download public key' do
  action :run
  command 'echo "$(curl https://github.com/taiki45.keys) taiki45.github" |tee -a authorized_keys'
  cwd "#{homedir}/.ssh"
  not_if '[ -f authorized_keys ] || grep -qf taiki45.github '
end

service 'ssh'

template '/etc/ssh/sshd_config' do
  action :create
  notifies :reload, 'service[ssh]'
end
