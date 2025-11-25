{% set use_defaults = not settings.disable_defaults_site and not settings.disable_defaults_homepage %}

{% if settings.brands is defined %}
    {% if settings.brands and settings.brands is not empty %}
	<section class="section-brands-home" data-store="home-brands">
		<div class="container">
			<div class="row">
				<div class="col p-0 px-md-3">
					<div class="js-swiper-brands swiper-container">
					    <div class="swiper-wrapper">
					        {% for slide in settings.brands %}
								{% set has_text =  slide.title or slide.description or slide.button %}
					        	{% set slide_image = slide.image | static_url %}
				                <div class="swiper-slide slide-container">
									<div class="brand-image-container">
										{% if slide.link %}
											<a href="{{ slide.link | setting_url }}" title="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}" aria-label="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
										{% endif %}
											<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide_image | settings_image_url('large') }}" class="lazyload brand-image" alt="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
										{% if slide.link %}
											</a>
										{% endif %}

										{% if has_text %}
											<div class="brand-text swiper-{{ slide.color }}">
												{% if slide.title %}
													<div class="title{% if has_auto_height_slider and not has_mobile_slider %} swiper-title-small{% endif %}">{{ slide.title }}</div>
												{% endif %}
												{% if slide.description %}
													<div class="description {% if has_auto_height_slider and not has_mobile_slider %}font-small font-md-normal mb-md-3 mb-2{% else %}mb-3{% endif %}">{{ slide.description }}</div>
												{% endif %}
											</div>
										{% endif %}
									</div>
				            	</div>
					        {% endfor %}
					    </div>
					</div>
				</div>
			</div>
		</div>
		<div class="js-swiper-brands-prev swiper-button-prev d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}">
			<svg class="icon-inline icon-2x mr-1 icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
		</div>
	    <div class="js-swiper-brands-next swiper-button-next d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}">
	    	<svg class="icon-inline icon-2x ml-1"><use xlink:href="#chevron"/></svg>
	    </div>
	</section>
    {% else %}
	{% if use_defaults %}
        <section class="section-brands-home" data-store="home-brands">
            <div class="container">
                <div class="row">
                    <div class="col p-0 px-md-3">
                        <div class="js-swiper-brands swiper-container">
                            <div class="swiper-wrapper">
                                {% for i in [1,2,3] %}
                                    <div class="swiper-slide slide-container">
                                        <div class="brand-image-container">
                                            <img src="https://placehold.co/300x200?text=300x200 : Marca+{{ i }}" class="brand-image" alt="{{ 'Placeholder brand' | translate }} {{ i }}">
                                            <div class="brand-text">
                                                <div class="title">{{ 'Marca' | translate }} {{ i }}</div>
                                                <div class="description">{{ 'Conheça nossas marcas' | translate }}</div>
                                            </div>
                                        </div>
                                    </div>
                                {% endfor %}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="js-swiper-brands-prev swiper-button-prev d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}"></div>
            <div class="js-swiper-brands-next swiper-button-next d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}"></div>
        </section>
	{% endif %}
    {% endif %}
{% endif %}
