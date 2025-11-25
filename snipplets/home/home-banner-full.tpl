{% set use_defaults = not settings.disable_defaults_site and not settings.disable_defaults_homepage %}

{% if settings.banner_full is defined %}
    {% if settings.banner_full and settings.banner_full is not empty %}
	<section class="section-banner_full-home" data-store="home-banner_full">
		<div class="container">
			<div class="row">
				<div class="col p-0 px-md-3">
					<div class="js-swiper-banner_full swiper-container">
					    <div class="swiper-wrapper">
					        {% for slide in settings.banner_full %}
								{% set has_text =  slide.title or slide.description or slide.button %}
					        	{% set slide_image = slide.image | static_url %}

								<div class="swiper-slide slide-container">
									<div class="banner_full-image-container">
										{% if slide.link %}
											<a href="{{ slide.link | setting_url }}" title="{{ 'Banner {1} de' | translate(loop.index) }} {{ store.name }}" aria-label="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
										{% endif %}
											<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide_image | settings_image_url('large') }}" class="lazyload banner_full-image" alt="{{ 'Marca {1} de' | translate(loop.index) }} {{ store.name }}">
										{% if slide.link %}
											</a>
										{% endif %}

										{% if has_text %}
											<div class="banner_full-text swiper-{{ slide.color }}">
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
		<div class="js-swiper-banner_full-prev swiper-button-prev d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}">
			{# <svg class="icon-inline icon-2x mr-1 icon-flip-horizontal"><use xlink:href="#chevron"/></svg> #}
		</div>
	    <div class="js-swiper-banner_full-next swiper-button-next d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}">
	    	{# <svg class="icon-inline icon-2x ml-1"><use xlink:href="#chevron"/></svg> #}
	    </div>
	</section>
    {% else %}
		{% if use_defaults %}
        <section class="section-banner_full-home" data-store="home-banner_full">
            <div class="container">
                <div class="row">
                    <div class="col p-0 px-md-3">
                        <div class="js-swiper-banner_full swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide slide-container">
                                    <div class="banner_full-image-container">
                                        <img src="https://placehold.co/1200x500?text=1200x500 : Banners+full+" class="banner_full-image" alt="{{ 'Placeholder banner' | translate }} {{ i }}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="js-swiper-banner_full-prev swiper-button-prev d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}"></div>
            <div class="js-swiper-banner_full-next swiper-button-next d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}"></div>
        </section>
		{% endif %}
    {% endif %}
{% endif %}
