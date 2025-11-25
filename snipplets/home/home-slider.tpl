{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
{% set has_auto_height_slider = not settings.slider_viewport_height %}
{% set use_smaller_thumbs = (has_auto_height_slider and not has_mobile_slider) or has_mobile_slider %}

{% if not mobile %}
<div class="js-home-main-slider-container {% if not has_main_slider %}hidden{% endif %}">
{% endif %}
	<div class="js-live-preview-home-slider-container {% if mobile %}js-home-mobile-slider{% else %}js-home-main-slider{% endif %}-visibility {% if has_main_slider and has_mobile_slider %}{% if mobile %}d-md-none{% else %}d-none d-md-block{% endif %}{% elseif not settings.toggle_slider_mobile and mobile %}hidden{% endif %} {% if not settings.slider_full %} mt-4{% endif %} mb-4">
		<div class="">
			<div class="row mx-0">
				<div class="col js-home-slider-col section-slider{% if settings.slider_full %} p-0{% endif %}{% if has_auto_height_slider %} section-slider-auto{% endif %}">
					<div class="js-home-slider{% if mobile %}-mobile{% endif %} nube-slider-home swiper-container{% if settings.theme_rounded and not settings.slider_full %} box-rounded{% endif %} js-swiper-roundable-border swiper-container-horizontal">
						<div class="swiper-wrapper">
							{% if mobile %}
								{% set slider = settings.slider_mobile %}
							{% else %}
								{% set slider = settings.slider %}
							{% endif %}
							{% for slide in slider %}
								<div class="swiper-slide slide-container">

									{% if slide.title == 'video' %}
										{% set video_url = slide.link %}
									
										{% if '/watch?v=' in slide.link %}
											{% set video_format = '/watch?v=' %}
										{% elseif '/youtu.be/' in slide.link %}
											{% set video_format = '/youtu.be/' %}
										{% elseif '/shorts/' in slide.link %}
											{% set video_format = '/shorts/' %}
										{% endif %}
									
										{% set video_id = video_url|split(video_format)|last %}
									
										<div class="js-home-video-container lazyload home-video embed-responsive embed-responsive-16by9{% if settings.video_vertical_mobile %} embed-responsive-1by1{% endif %} position-relative{% if has_video_text %} home-video-overlay{% endif %}">
											<div class="js-home-video-image d-block d-md-none">
												{% if "video_image.jpg" | has_custom_image %}
													{% set video_image_src = 'video_image.jpg' | static_url | settings_image_url("large") %}
												{% else %}
													{% set video_image_src = 'https://img.youtube.com/vi_webp/' ~ video_id ~ '/maxresdefault.webp' %}
												{% endif %}
												<img class="home-video-image" src='{{ video_image_src }}'
													 {% if "video_image.jpg" | has_custom_image %}
														 srcset='{{ "video_image.jpg" | static_url | settings_image_url("original") }} 1024w, {{ "video_image.jpg" | static_url | settings_image_url("1080p") }} 1920w'
													 {% endif %}
													 alt="{{ 'Video de' | translate }} {{ store.name }}" />
												<div class="placeholder-shine placeholder-shine-invert"></div>
											</div>
									
											<!-- Div do player com ID único -->
											<div class="js-home-video" data-video-id="{{ video_id }}" id="player-{{ loop.index }}"></div>
											<div class="home-video-hide-controls"></div>
										</div>
									{% else %}
										{% if slide.link %}
											<a href="{{ slide.link | setting_url }}" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
										{% endif %}	
										{% set has_text =  slide.title or slide.description or slide.button %}
										<div class="slider-slide{% if has_auto_height_slider %} position-relative h-auto{% endif %}">

											{% set apply_lazy_load = not (loop.first and ((has_main_slider and not has_mobile_slider) or (has_mobile_slider and mobile))) %}
											{% set slide_image = slide.image | static_url %}

											{% if apply_lazy_load %}
												{% set slide_src = slide_image | settings_image_url('tiny') %}
											{% else %}
												{% set slide_src = slide_image | settings_image_url('large') %}
											{% endif %}

											<img 
												{% if slide.width and slide.height %} width="{{ slide.width }}" height="{{ slide.height }}" {% endif %}
												src="{{ slide_src }}"
												{% if apply_lazy_load %}data-{% endif %}srcset="{% if use_smaller_thumbs %}{{ slide_image | settings_image_url('large') }} 480w, {{ slide_image | settings_image_url('huge') }} 640w, {% endif %}{{ slide_image | settings_image_url('original') }} 1024w, {{ slide_image | settings_image_url('1080p') }} 1920w"  
												class="slider-image {% if apply_lazy_load %}swiper-lazy blur-up-huge{% endif %}{% if has_auto_height_slider %} d-block{% endif %}" alt="{{ 'Carrusel' | translate }} {{ loop.index }}"
											/>

											{% if has_text %}
												<div class="swiper-text swiper-{{ slide.color }}">	
													{% if slide.description %}
														<div class="swiper-description {% if has_auto_height_slider and not has_mobile_slider %}font-small font-md-normal mb-md-3 mb-2{% else %}mb-3{% endif %}">{{ slide.description }}</div>
													{% endif %}
													{% if slide.title %}
														<div class="swiper-title{% if has_auto_height_slider and not has_mobile_slider %} swiper-title-small{% endif %}">{{ slide.title }}</div>
													{% endif %}
													{% if slide.button and slide.link %}
														<div class="btn btn-primary btn-small swiper-btn {% if has_auto_height_slider and not has_mobile_slider %} btn-extra-small btn-extra-small-md mt-md-4 mt-2  px-md-4{% else %}mt-4 px-4{% endif %}">{{ slide.button }}</div>
													{% endif %}
												</div>
											{% endif %}
										</div>
										{% if slide.link %}
											</a>
										{% endif %}
									{% endif %}	
								</div>
							{% endfor %}
						</div>
						<div class="js-swiper-home-control js-swiper-home-pagination{% if mobile %}-mobile{% endif %} swiper-pagination swiper-pagination-bullets d-block">
							{% if slider | length > 1 and not params.preview %}
								{% for slide in slider %}
									<span class="swiper-pagination-bullet"></span>
								{% endfor %}
							{% endif %}
						</div>
						<div class="js-swiper-home-control js-swiper-home-prev{% if mobile %}-mobile{% endif %} swiper-button-prev d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}">
							<svg class="icon-inline icon-1x mr-1 icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
						</div>
						<div class="js-swiper-home-control js-swiper-home-next{% if mobile %}-mobile{% endif %} swiper-button-next d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}">
							<svg class="icon-inline icon-1x ml-1"><use xlink:href="#chevron"/></svg>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{% if not mobile %}
</div>
{% endif %}


<script>
    function onYouTubeIframeAPIReady() {
        document.querySelectorAll('.js-home-video').forEach(video => {
            const videoId = video.getAttribute('data-video-id');
            const elementId = video.getAttribute('id');

            new YT.Player(elementId, {
                width: '100%',
                videoId: videoId,
                playerVars: {
                    'autoplay': 1,
                    'playsinline': 1,
                    'rel': 0,
                    'loop': 1,
                    'controls': 0,
                    'showinfo': 0,
                    'modestbranding': 1,
                    'fs': 0,
                    'iv_load_policy': 3
                },
                events: {
                    'onReady': function (event) {
                        event.target.mute();
                        event.target.playVideo();
                    }
                }
            });
        });
    }
</script>
