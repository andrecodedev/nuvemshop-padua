{% set use_defaults = not settings.disable_defaults_site and not settings.disable_defaults_homepage %}

<div class="custom-banner-wrapper container-fluid">
    <div class="row">
        {% set banner_show = settings.banner_promotional_01_show %}
        {% set banner_title = settings.banner_promotional_01_title %}
        {% set banner_image_src = 'banner_promotional_01.png' | static_url %}
        {% set banner_top_title = settings.banner_promotional_01_top_title %}
        {% set banner_description = settings.banner_promotional_01_description %}
        {% set banner_button_text = settings.banner_promotional_01_button %}
        {% set banner_url = settings.banner_promotional_01_url %}
        {% set banner_image_logo_src =  'banner_promotional_logo_01.png' | static_url %}
        {% set has_banner = banner_show and (banner_title or banner_image) %}
        {% set has_banner_text = banner_title or banner_button_text %}

        {% if has_banner %}
            <div class="custom-banner-container col-md-12" data-visible="true">
                <div class="custom-banner-content d-flex row align-items-center mx-0">

                    <div class="custom-banner-image col-md-6 d-none d-md-flex">
                        <figure class="wrapper-image">
                            <img class="lazyautosizes lazyload " {% if banner_image_src %}src="{{ banner_image_src | settings_image_url('tiny') }}" data-srcset="{{ banner_image_src | settings_image_url('large') }} 480w, {{ banner_image_src | settings_image_url('huge') }} 640w" data-sizes="auto" data-expand="-10"{% endif %} {% if banner_title %}alt="{{ banner_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} />
                        </figure>
                    </div>

                    <div class="custom-banner-text col-12 col-md-6">
                        <div class="custom-banner-details">
                            <div class="custom-banner-highlight">
                                {{ banner_top_title }}
                            </div>
                            <h3 class="custom-banner-title">{{ banner_title }}</h3>
                            <p class="custom-banner-description">{{ banner_description | raw }}</p>
                            {% if banner_button_text and banner_url %}
                            <a href="{{ banner_url | setting_url }}" class="custom-banner-button">
                                {{ banner_button_text }}
                            </a>
                            {% endif %}
                        </div>
                        {% if banner_image_logo_src %}
                        <div class="custom-banner-logo d-none d-md-flex">
                            <img class="lazyautosizes lazyload " {% if banner_image_logo_src %}src="{{ banner_image_logo_src | settings_image_url('tiny') }}" data-srcset="{{ banner_image_logo_src | settings_image_url('large') }} 480w, {{ banner_image_logo_src | settings_image_url('huge') }} 640w" data-sizes="auto" data-expand="-10"{% endif %} />
                        </div>
                        {% endif %}
                    </div>

                    <div class="custom-banner-image col-9 d-flex d-md-none">
                        <figure class="wrapper-image">
                            <img class="lazyautosizes lazyload " {% if banner_image_src %}src="{{ banner_image_src | settings_image_url('tiny') }}" data-srcset="{{ banner_image_src | settings_image_url('large') }} 480w, {{ banner_image_src | settings_image_url('huge') }} 640w" data-sizes="auto" data-expand="-10"{% endif %} {% if banner_title %}alt="{{ banner_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} />
                        </figure>
                    </div>
                    {% if banner_image_logo_src %}
                        <div class="custom-banner-logo d-flex d-md-none col-3">
                            <img class="lazyautosizes lazyload w-100" {% if banner_image_logo_src %}src="{{ banner_image_logo_src | settings_image_url('tiny') }}" data-srcset="{{ banner_image_logo_src | settings_image_url('large') }} 480w, {{ banner_image_logo_src | settings_image_url('huge') }} 640w" data-sizes="auto" data-expand="-10"{% endif %} />
                        </div>
                    {% endif %}

                </div>
            </div>
        {% else %}
        {% if use_defaults %}
            <div class="custom-banner-container col-md-12" data-visible="false">
                <div class="custom-banner-content d-flex row align-items-center mx-0">
                    <div class="custom-banner-image col-md-6 d-none d-md-flex">
                        <figure class="wrapper-image">
                            <img src="https://placehold.co/620x715?text= 620x715 : Banners+promocional" class="" alt="{{ 'Placeholder banner' | translate }} 1" />
                        </figure>
                    </div>

                    <div class="custom-banner-text col-12 col-md-6">
                        <div class="custom-banner-details">
                            <div class="custom-banner-highlight">{{ 'Destaque' | translate }}</div>
                            <h3 class="custom-banner-title">{{ 'Promoções' | translate }}</h3>
                            <p class="custom-banner-description">{{ 'Confira nossas promoções e ofertas' | translate }}</p>
                            <a href="#" class="custom-banner-button">{{ 'Ver mais' | translate }}</a>
                        </div>
                        <div class="custom-banner-logo d-none d-md-flex">
                            <img src="https://placehold.co/97x130?text=97x130 : Logo" alt="{{ 'Logo placeholder' | translate }}" />
                        </div>
                    </div>

                    <div class="custom-banner-image col-9 d-flex d-md-none">
                        <figure class="wrapper-image">
                            <img src="https://placehold.co/620x715?text= 620x715 : Banners+promocional" alt="{{ 'Placeholder banner' | translate }} 1" />
                        </figure>
                    </div>
                    <div class="custom-banner-logo d-flex d-md-none col-3">
                        <img src="https://placehold.co/97x130?text=97x130 : Logo" class="w-100" alt="{{ 'Logo placeholder' | translate }}" />
                    </div>
                </div>
            </div>
        {% endif %}
        {% endif %}
    </div>
</div>
