# vSphere VM Templates with HashiCorp Packer

## Description

This repository contains **HashiCorp Packer** configurations used to automate the creation of **virtual machine (VM) templates** for **VMware vSphere**, based on various operating systems such as **Microsoft Windows** (e.g., Windows Server 2022) and **Linux distributions** (e.g., RHEL, Rocky Linux).

The goal is to standardize and automate image creation to ensure **consistency**, **repeatability**, and **faster provisioning** across environments. This aligns with modern **Infrastructure as Code (IaC)** practices and contributes to a streamlined VM lifecycle.

---

## Objectives

- Define Packer templates to automate the creation of Windows and Linux images.
- Optimize images for use in vSphere (e.g., VMware Tools, drivers, guest customization).
- Automate system updates and basic configurations (e.g., locale, time zone).
- Enable remote management (WinRM for Windows, SSH for Linux) for further provisioning.
- Integrate generalization steps (e.g., Sysprep for Windows) to produce reusable templates.
- Provide clear documentation for building, maintaining, and using the templates.

---

## Deliverables

- Fully working Packer configurations and supporting scripts.
- Clean, tested, and deployable VM templates for vSphere.
- Comprehensive documentation covering:
  - Prerequisites
  - Build and automation process
  - Usage instructions for deploying templates in vSphere

---

## Benefits

- Reduce manual effort in provisioning new VMs.
- Improve consistency and reliability across environments.
- Speed up the deployment of new services and infrastructure components.
- Support integration into CI/CD pipelines and automated workflows.

---

## Getting Started

### Prerequisites

Before using this repository, make sure you have the following tools installed on your system:

- [Packer](https://www.packer.io/downloads)
- [VMware vSphere](https://www.vmware.com/products/vsphere.html) environment (ESXi & vCenter)
- A valid ISO file or access to an ISO repository (Windows / Linux)
- A user account with sufficient privileges on vSphere
- (Optional) [PowerCLI](https://developer.vmware.com/powercli) or [govc](https://github.com/vmware/govmomi/tree/master/govc) for interacting with vSphere
- SSH key or Windows admin credentials for provisioning

### Folder Structure

```bash
packer-vsphere-templates/
├── windows/
│   ├── server-2022/
│   │   ├── server-2022.pkr.hcl
│   │   ├── server-2022.auto.pkrvars.hcl
│   │   ├── autounattend.xml
│   │   ├── data/
│   │   │   ├── autounattend.pkrtpl.hcl
│   │   ├── sysprep/
│   │   │   ├── sysprep.xml
│   │   └── scripts/
│   │       ├── install-vmtools.ps1
│   │       ├── enable-winrm.ps1
│   │       └── cleanup.ps1
│   ├── scripts/
│   │   ├── windows-init.ps1
│   │   ├── windows-prepare.ps1
│   │   ├── windows-vmtools.ps1
│   └── ...
├── linux/
│   ├── rhel-9/
│   │   ├── rhel-9.pkr.hcl
│   │   └── scripts/
│   │       ├── postinstall.sh
│   │       ├── vmtools-install.sh
│   │       └── cleanup.sh
│   ├── rocky-9/
│   │   ├── rocky-9.pkr.hcl
│   │   └── scripts/
│   │       ├── postinstall.sh
│   │       └── cleanup.sh
│   └── ...
├── variables/
│   ├── windows.pkrvars.hcl
│   ├── linux.pkrvars.hcl
│   └── common.pkrvars.hcl
│   └── vsphere.pkrvars.hcl
├── docs/
│   ├── architecture.md
│   ├── usage.md
│   └── troubleshooting.md
├── templates-output/         # (optional) Where built images metadata/logs are stored
├── LICENSE
├── README.md
└── .gitignore
```

### Usage

1.Clone the repository:

```bash
git clone https://github.unil.ch/ci-dcsr/packer-vsphere-templates.git
cd packer-vsphere-templates
```

2.Create or modify your variables file:

```bash
cp variables/variables.example.pkrvars.hcl variables/variables.pkrvars.hcl
```

3.Validate the Packer configuration:

```bash
packer validate -var-file=variables/variables.pkrvars.hcl windows/windows-server-2022.pkr.hcl
```

4.Build the image:

For Windows:

```bash
packer build -var-file=variables/variables.pkrvars.hcl windows/windows-server-2022.pkr.hcl
```

For Linux:

```bash
packer build -var-file=variables/variables.pkrvars.hcl linux/rhel-template.pkr.hcl
```

---

## Notes

- Ensure the templates meet your internal hardening or compliance standards.
- You can integrate this build process into a CI/CD pipeline for full automation.
- Logs and artifacts can be stored in a central repository for auditing and traceability.

---

## License

`NinjaOne` :ninja:
