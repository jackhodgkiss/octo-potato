# This file is used to configure kayobe-automation.
# https://github.com/stackhpc/kayobe-automation/blob/main/README.md

# See: https://github.com/stackhpc/docker-rally/blob/master/bin/rally-verify-wrapper.sh for a full list of tempest parameters that can be overriden.
# You can override tempest parameters like so:
export TEMPEST_CONCURRENCY=16
# Specify single test whilst experimenting
#export TEMPEST_PATTERN="${TEMPEST_PATTERN:-tempest.api.compute.servers.test_create_server.ServersTestJSON.test_host_name_is_same_as_server_name}"

if [[ -z "${KAYOBE_AUTOMATION_TEMPEST_CONF_OVERRIDES:+x}" ]] || [[ ! -e "${KAYOBE_AUTOMATION_TEMPEST_CONF_OVERRIDES}" ]]; then
    KAYOBE_AUTOMATION_TEMPEST_CONF_OVERRIDES="${KAYOBE_AUTOMATION_CONFIG_PATH}/tempest/tempest.overrides.conf"
fi

if [[ -f ${KAYOBE_AUTOMATION_REPO_ROOT}/etc/kolla/public-openrc.sh ]]; then
    export TEMPEST_OPENRC="$(< ${KAYOBE_AUTOMATION_REPO_ROOT}/etc/kolla/public-openrc.sh)"
fi
