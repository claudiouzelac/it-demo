# Mozilla IT Offsite

[![Build Status](https://travis-ci.org/mozilla-it/it-demo.svg?branch=master)](https://travis-ci.org/mozilla-it/it-demo)

[![codecov](https://codecov.io/gh/mozilla-it/it-demo/branch/master/graph/badge.svg)](https://codecov.io/gh/mozilla-it/it-demo)

## Objectives

To present a methodology for continuous integration (CI) and continuous deploymentment (CD) that can be leveraged
as a group.

## Up and Running

### Prerequisites

* [Python 3.6+](https://www.python.org/downloads/release/python-360/)
* [Pipenv](https://docs.pipenv.org/en/latest/)
* [tfenv](https://github.com/tfutils/tfenv)
* [Travis CI Client](https://github.com/travis-ci/travis.rb)

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

#### Pre-commit Hooks

A variety of pre-commit hooks are installed as part of the development workflow.  These may be seen in `.pre-commit-config.yaml`.

##### Secrets Check Hook

There is a secrets check in place to prevent from accident check-in of AWS or other credentials into version control.  As a test, you may execute this command and attempt
to commit this code:

```
cat >> credentials <<EOF

[commit-test]
aws_access_key_id = AKIA1111111111111111 # pragma: allowlist secret
aws_secret_access_key = 1111111111111111111111111111111111111111 # pragma: allowlist secret
EOF
```

Next as a test, execute the command, `git add credentials` and then make an
attempt to `git commit -m 'adding a secret'`.  You will now see this as part of the
hook:

`Detect secrets...........................................................Failed`

#### Test Execution

Test Driven Devoplement (TDD) and Behavior Drive Development (BDD) tests can be ran with the command, `pytest --cov=./`.  This not only runs the tests but also creates a coverage
report for the code that you have written.  If you do not wish to have a coverage
report then merely omit the argument.

#### Code Quality

Code quality is measured using [CodeCov](https://codecov.io/gh/mozilla-it/it-demo).  This tool tracks code quality over a variety of projections.  There is a badge in the header of this `README` file that will take you to the hosted site to observe code quality metrics.

### Continuous Integration (CI)

This code base utilizes [Travis CI](https://travis-ci.com/mozilla-it/it-demo) for it's CI process.  There is a build status badge placed at the top of this `README` file to indicate the status of this projects build on the master branch.

#### Adding An Encrypted CI Secret

Secrets can be added to the CI build job with the following command line expression:

    `travis encrypt --add ENVAR_KEY=ENVAR_VALUE`

### Deployment

1. Install the correct version of Terraform with the command, `tfenv install`.
2.

### References

1. [Terraform Documentation](https://www.terraform.io/docs/index.html)
2. [TravisCI Documentation](https://docs.travis-ci.com/)
3. [Pipenv Documentation](https://docs.pipenv.org/en/latest/)
4. [Poetry Documentation](https://poetry.eustace.io/docs/)
5. [CodeCov Example Repository](https://github.com/codecov/example-python)
6. [CodeCov Documentation](https://docs.codecov.io/docs)

## Author(s)

Stewart Henderson
