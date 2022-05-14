<br>

<div align="center">
<img width="456" height="60" src="./assets/logo.gh-light-mode-only.png#gh-light-mode-only">
<img width="456" height="60" src="./assets/logo.gh-dark-mode-only.png#gh-dark-mode-only">
</div>


<br>

<br>

<div align="center">
<a href="https://actions-badge.atrox.dev/wayofdev/ansible-role-dotfiles/goto"><img alt="Build Status" src="https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fwayofdev%2Fansible-role-dotfiles%2Fbadge&style=flat-square"/></a>
<a href="https://galaxy.ansible.com/lotyp/dotfiles"><img alt="Ansible Role" src="https://img.shields.io/ansible/role/59060?style=flat-square"/></a>
<a href="https://github.com/wayofdev/ansible-role-dotfiles/tags"><img src="https://img.shields.io/github/v/tag/wayofdev/ansible-role-dotfiles?sort=semver&style=flat-square" alt="Latest Version"></a>
<a href="https://galaxy.ansible.com/lotyp/dotfiles">
<img alt="Ansible Quality Score" src="https://img.shields.io/ansible/quality/59060?style=flat-square"/></a>
<a href="https://galaxy.ansible.com/lotyp/dotfiles">
<img alt="Ansible Role" src="https://img.shields.io/ansible/role/d/59060?style=flat-square"/></a>
<a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square" alt="Software License"/></a>
</div>


<br>

# Ansible Role: Chezmoi for MacOS

Role is used to automate installation and setup of [chezmoi](https://thekelleys.org.uk/dnsmasq/doc.html) on MacOS, Ubuntu and Debian systems. 

<br>

### → Why should I use a dotfile manager?

> Dotfile managers give you the combined benefit of a consistent environment everywhere with an undo command and a restore from backup.

> As the core of our development environments become increasingly standardized (e.g. using git at both home and work), and we further customize them, at the same time we increasingly work in ephemeral environments like Docker containers, virtual machines, and GitHub Codespaces.

> In the same way that nobody would use an editor without an undo command, or develop software without a version control system, chezmoi brings the investment that you have made in mastering your tools to every environment that you work in.

<div align="right">
  <a href="https://www.chezmoi.io/why-use-chezmoi/">www.chezmoi.io/why-use-chezmoi</a>
</div>

### → Why Chezmoi for dotfiles?

When I dediced to develop a role for my dotfiles I did some research over existing dotfile managers. Chezmoi has a great comparsion table over other dotfile managers. Please see this [comparsion table](https://www.chezmoi.io/comparison-table/)

<br>

## 📑 Requirements

  - **Homebrew**: Requires `homebrew` already installed (you can use `geerlingguy.mac.homebrew` to install it on your Mac).
  - **ansible.community.general** – installation handled by `Makefile` and it is defined in `requirements.yml`

<br>

## 🔧 Role Variables

Section shows all possible variants of adding, moving, replacing and removing of applications, spacers, folders. Available variables are listed below, along with example values (see `defaults/main.yml`):

### → Structure

Structure of dictionary item for **adding** apps. All available options are listend below:

```yaml
---

something:
	here: goes

```

<br>

## 📦 Dependencies

  - (Soft dependency) `geerlingguy.homebrew`

<br>

## 📗 Example Playbook

```yaml
---
- hosts: localhost

  vars:
    dotfiles:
      repository:
        # From where should we take dotfiles?
        # Example repository: https://github.com/benmezger/dotfiles
        # By default, my personal is used.
        url: https://github.com/lotyp/dotfiles.git
        branch: master

  roles:
    - geerlingguy.mac.homebrew
    - lotyp.dotfiles
```

<br>

## ⚙️ Development

To install dependencies and start development you can check contents of our `Makefile`

**Install** depdendencies:

```bash
$ make install-deps
```

**Install** all git hooks:

```bash
$ make hooks
```

<br>

## 🧪 Testing

For local testing you can use these comands to test whole role or separate tasks:

> :warning: **Notice**: By defaut all tests are ran against your local machine!

```bash
# run all tasks in role
$ make test

# run only install tasks
$ make test-install

# run only configuration tasks
$ make test-configure
```

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

[![Licence](https://img.shields.io/github/license/wayofdev/ansible-role-dock?style=for-the-badge)](./LICENSE)

<br>

## 🙆🏼‍♂️ Author Information

This role was created in **2022** by [lotyp / wayofdev](https://github.com/wayofdev).

