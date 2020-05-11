resource_name :postgresql_test

action :create do
  postgresql_version = "12"
  postgresql_service = "postgresql@#{postgresql_version}-main"

  postgresql_server_install "main" do
    version postgresql_version
    setup_repo true
    password "secret"
    action :install
  end

  service postgresql_service do
    supports restart: true, status: true, reload: true
  end

  postgresql_access "test" do
    access_type "host"
    access_db "replication"
    access_user "replication"
    access_addr "192.168.42.26/32"
    access_method "md5"
    # notification does not work, as postgresql_access always says the
    # resource was already up to date
    notifies :reload, "service[#{postgresql_service}]", :immediately
  end
end
