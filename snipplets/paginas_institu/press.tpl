{% set use_defaults = not settings.disable_defaults_site and not settings.disable_defaults_homepage %}

{% if settings.press is defined and settings.press and settings.press is not empty %}
<section class="press-section px-5">
    <div class="row container-fluid">
        <div class="col-12 d-flex flex-column justify-content-center ">
            {% for slide in settings.press %}
                {% set has_text =  slide.title or slide.description or slide.button %}
                {% set slide_image = slide.image | static_url %}
                {% if has_text %}
                    <div class="press-text">
                        {% if slide.title %}
                            <div class="title">{{ slide.title }}</div>
                        {% endif %}
                        {% if slide.description %}
                            <div class="description ">{{ slide.description }}</div>
                        {% endif %}
                    </div>
                {% endif %}
                <div class="press-image-container">
                    {% if slide.link %}
                        <a href="{{ slide.link | setting_url }}" title="{{ store.name }}" aria-label="{{ store.name }}">
                    {% endif %}
                        <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide_image | settings_image_url('large') }}" class="lazyload press-image" alt="{{ store.name }}">
                    {% if slide.link %}
                        </a>
                    {% endif %}
                </div>
            {% endfor %}
        </div>
    </div>
</section>
{% else %}
{% if use_defaults %}
<section class="press-section px-5">
    <div class="row container-fluid">
        <div class="col-12 d-flex flex-column justify-content-center ">
            {% for i in [1,2,3] %}
                <div class="press-text">
                    <div class="title">{{ 'Press' | translate }} {{ i }}</div>
                    <div class="description">{{ 'Notícias e matérias em destaque.' | translate }}</div>
                </div>
                <div class="press-image-container">
                    <img src="https://placehold.co/1312x720?text=1312x720 : Press+{{ i }}" class="lazyload press-image" alt="{{ 'Press' | translate }} {{ i }}">
                </div>
            {% endfor %}
        </div>
    </div>
</section>
{% endif %}
{% endif %}
