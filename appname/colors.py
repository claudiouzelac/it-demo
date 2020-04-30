import flask_featureflags as feature_flags
from flasgger import Swagger
from flask import Flask
from flask import jsonify
from flask_featureflags import FeatureFlag
from flask_featureflags import is_active_feature

FEATURE_FLAGS = {
    'unfinished_feature': True,
}


def create_app():
    flask_app = Flask(__name__)
    flask_app.config.from_object('config.DevelopmentConfig')
    swagger = Swagger(flask_app)
    features = FeatureFlag(flask_app)
    return flask_app


app = create_app()

# Example: http://127.0.0.1:5000/colors/mixer/red/blue/
@app.route('/colors/mixer/<color1>/<color2>/')
@feature_flags.is_active_feature('color_mixer_feature')
def color_mixer(color1, color2):
    result = {'mixed': f'{color1}-{color2}'}
    return jsonify(result)


# Example: http://127.0.0.1:5000/colors/all/
@app.route('/colors/<palette>/')
def colors(palette):
    """Example endpoint returning a list of colors by palette
    This is using docstrings for specifications.
    ---
    parameters:
      - name: palette
        in: path
        type: string
        enum: ['all', 'rgb', 'cmyk']
        required: true
        default: all
    definitions:
      Palette:
        type: object
        properties:
          palette_name:
            type: array
            items:
              $ref: '#/definitions/Color'
      Color:
        type: string
    responses:
      200:
        description: A list of colors (may be filtered by palette)
        schema:
          $ref: '#/definitions/Palette'
        examples:
          rgb: ['red', 'green', 'blue']
    """
    all_colors = {
        'cmyk': ['cian', 'magenta', 'yellow', 'black'],
        'rgb': ['red', 'green', 'blue'],
    }
    if palette == 'all':
        result = all_colors
    else:
        result = {palette: all_colors.get(palette)}
    return jsonify(result)


if __name__ == '__main__':
    app.run(debug=True)
