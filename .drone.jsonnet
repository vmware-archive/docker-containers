local CI(distro, version, bootstrap_version='2018.3.3', salt_branch='develop', py_version='2') = {
  local salt_jenkins_branch = (
    if salt_branch == 'develop' then 'master' else salt_branch
  ),
  local target = distro + '-' + version,
  local repo = 'saltstack/au-' + target,
  local docker_tag = 'ci-' + salt_branch + '-py' + py_version,

  kind: 'pipeline',
  name: 'build-' + target + '-ci-' + salt_branch,
  steps: [
    {
      name: target + ':' + docker_tag,
      image: 'plugins/docker',
      settings: {
        auto_tag: false,
        repo: repo,
        tags: [docker_tag],
        build_args: [
          'FROM_IMAGE=' + target,
          'BOOTSTRAP_VERSION=' + bootstrap_version,
          'SALT_BRANCH=' + salt_branch,
          'SALT_JENKINS_BRANCH=' + salt_jenkins_branch,
          'PY_VERSION=' + py_version,
        ],
        dockerfile: 'ci/' + target + '/Dockerfile',
        username: { from_secret: 'username' },
        password: { from_secret: 'password' },
      },
      depends_on: [target + ':bs-' + bootstrap_version],
    },
  ],
};

local Bootstrapped(distro, version, bootstrap_version='2018.3.3') = {
  local target = distro + '-' + version,
  local repo = 'saltstack/au-' + target,
  local from_image = (
    if distro == 'opensuse' then 'opensuse/leap:' + version
    else distro + ':' + version
  ),
  local docker_tag = 'bs-' + bootstrap_version,
  local salt_branches = ['2017.7', '2018.3', '2019.2', 'develop'],
  local py_versions = (if std.setInter([target], ['centos-6', 'ubuntu-14.04']) != [] then ['2'] else ['2', '3']),

  kind: 'pipeline',
  name: 'au-' + target,
  steps: [
    {
      name: target + ':' + docker_tag,
      image: 'plugins/docker',
      settings: {
        auto_tag: false,
        repo: repo,
        tags: [docker_tag],
        build_args: [
          'FROM_IMAGE=' + from_image,
          'BOOTSTRAP_VERSION=' + bootstrap_version,
        ],
        dockerfile: 'bootstrapped/' + target + '/Dockerfile',
        username: { from_secret: 'username' },
        password: { from_secret: 'password' },
      },
    },
  ] + [
    CI(distro, version, salt_branch=salt_branch, py_version=py_version).steps[0]
    for salt_branch in salt_branches
    for py_version in py_versions
  ],
};

local distros = [
  { name: 'centos', version: '6' },
  { name: 'centos', version: '7' },
  { name: 'debian', version: '8' },
  { name: 'debian', version: '9' },
  { name: 'fedora', version: '28' },
  { name: 'fedora', version: '29' },
  { name: 'opensuse', version: '15.0' },
  { name: 'opensuse', version: '42.3' },
  { name: 'ubuntu', version: '14.04' },
  { name: 'ubuntu', version: '16.04' },
  { name: 'ubuntu', version: '18.04' },
];


[
  Bootstrapped(distro.name, distro.version)
  for distro in distros
] + [
  {
    kind: 'secret',
    data: {
      username: 'wdocTM4pqjeNWmHMUfu0RTW3UAjLIqUtCckMF9uR_jVh1Qrx4kx7GjphJ42NFXWC',
      password: 'Vcp25vpJHVhRiVF_9SRv2I0sHWAxJlae1tDTDXYzoKnXnxxw_H2Hjj6ZXPGz',
    },
  },
]
