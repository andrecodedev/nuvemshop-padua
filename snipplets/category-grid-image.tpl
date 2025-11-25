{% set image_sizes = ['small', 'large', 'huge', 'original', '1080p'] %}
{% set has_grid_product_images = grid_product.images is not empty %}

{% for size in image_sizes %}
    {% if has_grid_product_images %}
        {# Define images for admin categories #}
        {% set grid_product_images = grid_product_images|merge({(size):(grid_product.images | first | grid_product_image_url(size))}) %}
    {% else %}
        {# Define images for general banner #}
        {% set grid_product_images = grid_product_images|merge({(size):('banner-products.jpg' | static_url | settings_image_url(size))}) %}
    {% endif %}
{% endfor %}

<img class="lazyautosizes lazyload blur-up position-relative w-100" src="{{ grid_product_images['small'] }}" data-srcset="{{ grid_product_images['large'] }} 480w, {{ grid_product_images['huge'] }} 640w, {{ grid_product_images['original'] }} 1024w, {{ grid_product_images['1080p'] }} 1920w" data-sizes="auto" alt="{{ 'Banner de la categoría' | translate }} {{ grid_product.name }}" />
