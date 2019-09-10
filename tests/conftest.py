import pytest

from appname.colors import create_app

# @pytest.yield_fixture()
# def app(request):
#     app = create_app()
#     with app.test_request_context():
#         yield app


@pytest.fixture(scope='session')
def app(request):
    app = create_app()
    ctx = app.app_context()
    ctx.push()

    def teardown():
        ctx.pop()

    request.addfinalizer(teardown)
    return app
