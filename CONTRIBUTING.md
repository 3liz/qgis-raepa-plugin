# Contributing

This project is hosted on GitHub.

[Visit GitHub](https://github.com/3liz/qgis-raepa-plugin/){: .md-button .md-button--primary }

## Scripts

We provide a Makefile which helps the developers to:

* run tests,
* build the documentation (Processing algorithms)

## Code

SQL and Python are covered by unittests with Docker.

[![Tests 🎳](https://github.com/3liz/qgis-raepa-plugin/actions/workflows/ci.yml/badge.svg)](https://github.com/3liz/qgis-raepa-plugin/actions/workflows/ci.yml)

```bash
pip install -r requirements/dev.txt
flake8
make tests
```

## Documentation

[![Documentation 📚](https://github.com/3liz/qgis-raepa-plugin/actions/workflows/publish-doc.yml/badge.svg)](https://github.com/3liz/qgis-raepa-plugin/actions/workflows/publish-doc.yml)

The documentation is using [MkDocs](https://www.mkdocs.org/) with [Material](https://squidfunk.github.io/mkdocs-material/) :

```bash
pip install -r requirements/doc.txt
mkdocs serve
```

* Processing algorithms documentation can be generated with:

```bash
make processing-doc
```
