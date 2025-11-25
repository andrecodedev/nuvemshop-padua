{% if products and pages.is_last %}
	<div class="last-page" style="display:none;"></div>
{% endif %}
{# <p class="item" data-teste="{{ products|length | json_encode }}">{{ products |length | json_encode }}</p> #}
{% for product in products %}   
    {% if loop.first and has_banner %}
        {% for slide in settings.images_lista_produtos_init %}
            {% set slide_image = slide.image | static_url %}
            {% if slide.link == category.name %}
                <div class="col-12 col-md-8 col-lg-6 p-0 block-banner grid-4">
                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide_image | settings_image_url('large') }}" class="lazyload category-image-grid" alt="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
                </div>
                {% endif %}
            {% endfor %}            
    {% endif %}

    {% include 'snipplets/grid/item.tpl' %}


    {% if loop.last and products|length > 4 and has_banner %}
        {% for slide in settings.images_lista_produtos_end %}
            {% set slide_image = slide.image | static_url %}
            
            {% if slide.link == category.name %}
                <div class="col-12 col-md-8 col-lg-6 p-0 block-banner grid-4">
                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide_image | settings_image_url('large') }}" class="lazyload category-image-grid" alt="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
                </div>
                {% endif %}
            {% endfor %}
    {% endif %}
{% endfor %}


