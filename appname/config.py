class DevelopmentConfig:
    DEBUG = True
    FEATURE_FLAGS = {
        'color_mixer_feature': False,
    }


class ProductionConfig:
    DEVELOPMENT = False
    FEATURE_FLAGS = {
        'color_mixer_feature': False,
    }
