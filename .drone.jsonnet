local Bootstrapped(distro, version, bootstrap_version='2018.3.3') = {
  local target = distro + '-' + version,
  local repo = 'saltstack/au-' + target,
  local from_image = (
    if distro == 'opensuse' then 'opensuse/leap:' + version
    else distro + ':' + version
  ),

  kind: 'pipeline',
  name: 'build-' + target + '-bootstrapped',
  steps: [
    {
      name: 'bootstrap-' + target,
      image: 'plugins/docker',
    },
  ],
  settings: {
    repo: repo,
    tags: [
      'saltstack/au-' + target + ':bs',
      'saltstack/au-' + target + ':bs-' + bootstrap_version,
    ],
    build_args: [
      'FROM_IMAGE=' + from_image,
      'BOOTSTRAP_VERSION=' + bootstrap_version,
    ],
    dockerfile: 'bootstrapped/' + target + '/Dockerfile',
    username: { from_secret: 'username' },
    password: { from_secret: 'password' },
  },
};

local CI(distro, version, bootstrap_version='2018.3.3', salt_branch='develop') = {
  local salt_jenkins_branch = (
    if salt_branch == 'develop' then 'master' else salt_branch
  ),
  local target = distro + '-' + version,
  local repo = 'saltstack/au-' + target,
  local from_image = repo + ':bs-' + bootstrap_version,

  kind: 'pipeline',
  name: 'build-' + target + '-ci-' + salt_branch,
  steps: [
    {
      name: 'build-' + target + '-ci-' + salt_branch,
      image: 'plugins/docker',
    },
  ],
  settings: {
    tags: [
      'saltstack/au-' + target + ':ci-' + salt_branch,
    ],
    build_args: [
      'FROM_IMAGE=' + from_image,
      'BOOTSTRAP_VERSION=' + bootstrap_version,
      'SALT_BRANCH=' + salt_branch,
      'SALT_JENKINS_BRANCH=' + salt_jenkins_branch,
    ],
    dockerfile: 'ci/' + target + '/Dockerfile',
    username: { from_secret: 'username' },
    password: { from_secret: 'password' },
  },
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

local salt_branches = ['2017.7', '2018.3', '2019.2', 'develop'];

[
  Bootstrapped(distro.name, distro.version)
  for distro in distros
] + [
  CI(distro.name, distro.version, salt_branch=salt_branch)
  for distro in distros
  for salt_branch in salt_branches
] + [
  {
    kind: 'secret',
    data: {
      username: 'abN3l9Tx0zEJkMbqdHmWePr3WEsfEnk4ReTp_LZAnf_ZmJJ1F28SKR8V58dln8wOFg==',
      password: '_3uoXYrfAzFYGMlHbBIFbUAmd8DNtIVw_pFkkOLP4AkEVMZB-b-9uhsW_nbj1I1XXY-qqbTG4w8pbepoQDrHUH_AgnHdSi4=',
    },
  },
]