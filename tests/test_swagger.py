import pytest


@pytest.mark.usefixtures('app')
class TestSwagger:
    def test_apidocs(self, app):
        with app.test_client() as client:
            rv = client.get('/apidocs/')
        assert rv.status == '200 OK'
