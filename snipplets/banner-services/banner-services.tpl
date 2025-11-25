{% set use_defaults = not settings.disable_defaults_site and not settings.disable_defaults_encabezado %}

{% macro for_each_banner_include(template) %}
    {% for index in 1..4 %}
        {% set banner = 'banner_services_0' ~ index %}

        {% set banner_services_icon = attribute(settings,"#{banner}_icon") %}
        {% set banner_services_title = attribute(settings,"#{banner}_title") %}
        {% set banner_services_description = attribute(settings,"#{banner}_description") %}
        {% set banner_services_url = attribute(settings,"#{banner}_url") %}
        {% set banner_index = index %}
        {% set banner_show = banner_services_title or banner_services_description %}

        {% include template %}
    {% endfor %}
{% endmacro %}

{% import _self as banner_services %}

{# detect if any informative banners are configured locally #}
{% set has_informative_banners_local = false %}
{% for index in 1..4 %}
    {% set banner_key = 'banner_services_0' ~ index %}
    {% if attribute(settings, "#{banner_key}_title") or attribute(settings, "#{banner_key}_description") %}
        {% set has_informative_banners_local = true %}
    {% endif %}
{% endfor %}

<div class="section-informative-banners js-informative-banners-container">
    <div class="container">
        <div class="row">
            <div class="js-informative-banners swiper-container">
                <div class="swiper-wrapper">
                    {% if has_informative_banners_local %}
                        {{ banner_services.for_each_banner_include('snipplets/banner-services/banner-services-item.tpl') }}
                    {% else %}
                    {% if use_defaults %}
                        {% for i in 1..4 %}
                            <div class="service-item-container col-md swiper-slide p-0 px-md-3 js-informative-banner-container">
                                <div class="service-item mx-4 mx-md-0">
                                    <div class="row align-items-center">
                                        <div class="col-auto js-informative-banner-icon-{{ i }}">
                                            <svg class="icon-inline icon-5x svg-icon-text"><use xlink:href="#shipping-circle"/></svg>
                                        </div>
                                        <div class="col p-0">
                                            <h3 class="h5 m-0">{{ 'Serviço' | translate }} {{ i }}</h3>
                                            <p class="m-0">{{ 'Descrição do serviço' | translate }}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {% endfor %}
                    {% endif %}
                    {% endif %}
                </div>
                <div class="js-informative-banners-pagination service-pagination swiper-pagination swiper-pagination-black"></div>
            </div>
        </div>
    </div>
</div>
