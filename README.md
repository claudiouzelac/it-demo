# Mozilla IT Offsite

[![Build Status](https://travis-ci.org/mozilla-it/it-demo.svg?branch=master)](https://travis-ci.org/mozilla-it/it-demo)

## Objectives

To present a methodology for continuous integration (CI) and continuous deploymentment (CD) that can be leveraged
as a group.

## Up and Running

### Prerequisites

* [Python 3.6+])(https://www.python.org/downloads/release/python-360/)
* [Pipenv](https://docs.pipenv.org/en/latest/)
* [tfenv](https://github.com/tfutils/tfenv)

### Development

1. Clone the code from Github, `git clone `.
2. Change directory to the code, `cd `.
3. Open a terminal and execute the command, `pipenv shell`.
4. Synchronize your pipenv with changes as they are commited with, `pipenv sync`.
5. Synchronize your poetry packages (development and production) with the command, `poetry update`.
6. Install the git hooks, `pre-commit install`.
7. Cut a branch using a [git flow](https://nvie.com/posts/a-successful-git-branching-model/) or alternative branching strategy and do work.
8. Push changes up to Github.
9. Observe the status of the related continuous integration on your job.
10. Upon completion of the work and a successful build, submit a pull request (PR).

### Deployment

1. Install the correct version of Terraform with the command, `tfenv install`.

### References

1. [Terraform Documentation](https://www.terraform.io/docs/index.html)
2. [TravisCI Documentation](https://docs.travis-ci.com/)
3. [Pipenv Documentation](https://docs.pipenv.org/en/latest/)
4. [Poetry Documentation](https://poetry.eustace.io/docs/)

## Author(s)

Stewart Henderson
