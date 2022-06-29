<br>

<div align="center">
<img width="456" src="https://raw.githubusercontent.com/wayofdev/ansible-role-dotfiles/master/assets/logo.gh-light-mode-only.png#gh-light-mode-only">
<img width="456" src="https://raw.githubusercontent.com/wayofdev/ansible-role-dotfiles/master/assets/logo.gh-dark-mode-only.png#gh-dark-mode-only">
</div>



<br>

<br>

<div align="center">
<a href="https://actions-badge.atrox.dev/wayofdev/ansible-role-dotfiles/goto"><img alt="Build Status" src="https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fwayofdev%2Fansible-role-dotfiles%2Fbadge&style=flat-square"/></a>
<a href="https://galaxy.ansible.com/wayofdev/dotfiles"><img alt="Ansible Role" src="https://img.shields.io/ansible/role/59603?style=flat-square"/></a>
<a href="https://github.com/wayofdev/ansible-role-dotfiles/tags"><img src="https://img.shields.io/github/v/tag/wayofdev/ansible-role-dotfiles?sort=semver&style=flat-square" alt="Latest Version"></a>
<a href="https://galaxy.ansible.com/wayofdev/dotfiles"><img alt="Ansible Quality Score" src="https://img.shields.io/ansible/quality/59603?style=flat-square"/></a>
<a href="https://galaxy.ansible.com/wayofdev/dotfiles"><img alt="Ansible Role" src="https://img.shields.io/ansible/role/d/59603?style=flat-square"/></a>
<a href="LICENSE"><img src="https://img.shields.io/github/license/wayofdev/ansible-role-dotfiles.svg?style=flat-square&color=blue" alt="Software License"/></a>
<a href="#"><img alt="Commits since latest release" src="https://img.shields.io/github/commits-since/wayofdev/ansible-role-dotfiles/latest?style=flat-square"></a>
</div>



<br>

# Ansible Role: Chezmoi for MacOS

Role is used to automate installation and setup of [chezmoi](https://thekelleys.org.uk/dnsmasq/doc.html) on MacOS, Ubuntu and Debian systems.

If you **like/use** this role, please consider **starring** it. Thanks!

<br>

### → Why should I use a dotfile manager?

> Dotfile managers give you the combined benefit of a consistent environment everywhere with an undo command and a restore from backup.

> As the core of our development environments become increasingly standardized (e.g. using git at both home and work), and we further customize them, at the same time we increasingly work in ephemeral environments like Docker containers, virtual machines, and GitHub Codespaces.

> In the same way that nobody would use an editor without an undo command, or develop software without a version control system, chezmoi brings the investment that you have made in mastering your tools to every environment that you work in.

<div align="right">
  <a href="https://www.chezmoi.io/why-use-chezmoi/">www.chezmoi.io/why-use-chezmoi</a>
</div>

### → Why Chezmoi for dotfiles?

When I dediced to develop a role for my dotfiles I did some research over existing dotfile managers. Chezmoi has a great comparsion table over other managers. Check this [comparsion table](https://www.chezmoi.io/comparison-table/).

<br>

## 📑 Requirements

  - **Homebrew**: Requires `homebrew` already installed (you can use `wayofdev.homebrew` to install it on your macOS).
  - Up-to-date version of ansible. During maintenance/development, we stick to ansible versions and will use new features if they are available (and update `meta/main.yml` for the minimum version).
  - Compatible OS. See [compatibility](#-compatibility) table.
  - Role has dependencies on third-party roles on different operating systems. See `requirements.yml` and [dependencies](#-dependencies) section.

<br>

## 🔧 Role Variables

Available variables are listed below, along with example values (see `defaults/main.yml`):

<br>

### → Structure

```yaml
# From where should we take dotfiles?
# Example repository: "https://github.com/benmezger/dotfiles"
# By default, my personal is used.
dotfiles_repository_url: "https://github.com/lotyp/dotfiles.git"
dotfiles_repository_branch: master
```

<br>

## 📗 Example Playbook

```yaml
---
- hosts: all

  # is needed when running over SSH
  environment:
    - PATH: "/usr/local/bin:/usr/local/sbin:/opt/homebrew/bin:{{ ansible_env.PATH }}"

  roles:
    - wayofdev.homebrew
    - wayofdev.dotfiles
```

<br>

## ⚙️ Development

To install dependencies and start development you can check contents of our `Makefile`

**Install** [poetry](https://github.com/python-poetry/poetry) using [poetry-bin](https://github.com/gi0baro/poetry-bin) and all dev python dependencies:

```bash
$ make install
```

**Install** only python dependencies, assuming that you already have poetry:

```bash
$ make install-deps
```

**Install** all git hooks:

```bash
$ make hooks
```

**Lint** all role files:

```bash
$ make lint
```

<br>

## 🧪 Testing

You can check `Makefile` to get full list of commands for remote and local testing. For local testing you can use these comands to test whole role or separate tasks:

### → on localhost

> :warning: **Notice**: By defaut all tests are ran against your local machine!

```bash
# run molecule tests on localhost
$ poetry run molecule test --scenario-name default-macos-on-localhost -- -vvv

# or with make command
$ make m-local

# choose which tags will be included
$ export TASK_TAGS="dotfiles-install,dotfiles-configure"; make m-local

# runs molecule with docker driver
$ poetry run molecule test --scenario-name default -- -vvv

# or with make file
$ make m-linux
```

<br>

### → over SSH

```bash
# run molecule scenarios against remote machines over SSH
# this will need VM setup and configuration
$ poetry run molecule test --scenario-name default-macos-over-ssh -- -vvv

$ make m-remote

# tags also can be passed
$ export TASK_TAGS="dotfiles-install,dotfiles-configure"
$ make m-remote
```

<br>

## 📦 Dependencies

Installation handled by `Makefile` and requirments are defined in `requirements.yml`

### → for all

  - [ansible.community.general](https://docs.ansible.com/ansible/latest/collections/community/general/index.html)

### → only macOS

  - [elliotweiser.osx-command-line-tools](https://galaxy.ansible.com/elliotweiser/osx-command-line-tools/)
  - [wayofdev.homebrew](https://galaxy.ansible.com/wayofdev/homebrew)

### → only Linux

  - [geerlingguy.git](https://galaxy.ansible.com/geerlingguy/git)

<br>

## 🧩 Compatibility

This role has been tested on these systems:

| system / container | tag      |
| :----------------- | -------- |
| macos              | monterey |
| macos              | big-sur  |
| ubuntu             | latest   |
| debian             | latest   |

<br>

## 🤝 License

[![Licence](https://img.shields.io/github/license/wayofdev/ansible-role-dotfiles?style=for-the-badge&color=blue)](./LICENSE)

<br>

## 🙆🏼‍♂️ Author Information

This role was created in **2022** by [lotyp / wayofdev](https://github.com/wayofdev).

<br>

## 🫡 Contributors

<img align="left" src="https://img.shields.io/github/contributors-anon/wayofdev/ansible-role-dock?style=for-the-badge"/>

<a href="https://github.com/wayofdev/ansible-role-dotfiles/graphs/contributors">
  <img src="https://opencollective.com/wod/contributors.svg?width=890&button=false">
</a>

<br>
