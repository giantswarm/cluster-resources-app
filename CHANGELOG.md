# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.1] - 2022-09-16

## [0.1.0] - 2022-03-29

### Added

- Add `allow-all-egress` CiliumClusterwideNetworkPolicy for `cni: cilium`.
- Add `allow-all-ingress-from-host` CiliumNetworkPolicy (in `kube-system` namespace by default).
- Add `coredns` NetworkPolicy.

[Unreleased]: https://github.com/giantswarm/cluster-resources-app/compare/v0.1.1...HEAD
[0.1.1]: https://github.com/giantswarm/cluster-resources-app/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/giantswarm/cluster-resources-app/releases/tag/v0.1.0
