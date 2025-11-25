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