
    <!-- Seção About -->
    <section class="about-section px-5">
        <div class="row container-fluid">
            <div class="col-md-6 about-image">
                {% set banner_image_src = 'about.jpg'  | static_url %}
				<figure>
					<img class="lazyautosizes lazyload img-fluid" src="{{ banner_image_src  | settings_image_url('tiny') }}"                      data-srcset="{{ banner_image_src  | settings_image_url('large') }} 480w,                                   {{ banner_image_src  | settings_image_url('huge') }} 640w"                      data-sizes="auto" data-expand="-10" alt="{{ settings.about_title }}" />
				</figure>
			</div>
            <div class="col-md-6 d-flex flex-column justify-content-center about-text">
                <h2 class="font-weight-bold">{{settings.about_title}}</h2>
                {{ settings.about_description | raw }}
            </div>
        </div>
    </section>

    <!-- Seção Missão -->
    <section class="mission-section container-fluid d-none d-md-block">
		{% set banner_image_src_middle = 'about_banner.jpg'  | static_url %}
		<figure>
			<img class="lazyautosizes lazyload img-fluid" src="{{ banner_image_src_middle  | settings_image_url('tiny') }}" 
				data-srcset="{{ banner_image_src_middle  | settings_image_url('large') }} 480w, 
							{{ banner_image_src_middle  | settings_image_url('huge') }} 640w" 
				data-sizes="auto" data-expand="-10" alt="{{ settings.about_title }}" />
		</figure>
    </section>

	
    <!-- Seção Missão -->
    <section class="mission-section container-fluid d-md-none">
		{% set banner_image_src_middle = 'about_banner_mobile.jpg'  | static_url %}
		<figure>
			<img class="lazyautosizes lazyload img-fluid" src="{{ banner_image_src_middle  | settings_image_url('tiny') }}" 
				data-srcset="{{ banner_image_src_middle  | settings_image_url('large') }} 480w, 
							{{ banner_image_src_middle  | settings_image_url('huge') }} 640w" 
				data-sizes="auto" data-expand="-10" alt="{{ settings.about_title }}" />
		</figure>
    </section>

	
	<!-- Seção Valores -->
	

	<section class="values-section container-fluid">
		<div class="values py-5">
			<h2 class="text-center font-weight-bold mb-5 values-title">VALORES</h2>
			<div class="row justify-content-center">
				{% for index in 1..5 %}
					{% set value = 'value_0' ~ index %}
					{% set value_image = "#{value}.jpg" | static_url %}
					{% set value_title = attribute(settings, "#{value}_title") %}
					{% set value_show = value_title  %}
					
					{% if value_show %}
						<div class="col">
							<div class="card-block mb-4">
								{% if value_image %}
									<img src="{{ value_image | settings_image_url('huge') }}" 
										class="card-img-top" 
										alt="{{ value_title }}" 
										width="{{ value_image.width }}" 
										height="{{ value_image.height }}"
									/>
								{% endif %}
								<div class="card-body">
									<h5 class="card-title text-center font-weight-normal">{{ value_title }}</h5>
								</div>
							</div>
						</div>
					{% endif %}
				{% endfor %}
			</div>
		</div>
	</section>


					
    <!-- Seção Responsabilidade -->
    <section class="responsibility-section px-5 py-5">
        <div class="row container-fluid">
            <div class="col-md-6 d-flex flex-column justify-content-center about-text">
                <h2 class="font-weight-bold">{{ settings.about_image_last_title }}</h2>
                <p>{{ settings.about_image_last_description | raw }}</p>
            </div>
            <div class="col-md-6 ">
				<figure>
					{% set banner_image_src_last = 'about_image_last.jpg'  | static_url %}
					<img class="lazyautosizes lazyload img-fluid" src="{{ banner_image_src_last  | settings_image_url('tiny') }}" data-src="{{ banner_image_src_last  | settings_image_url('large') }} 480w, {{ banner_image_src_last  | settings_image_url('huge') }} 640w"  data-sizes="auto"  alt="{{ settings.about_title }}" />
				</figure>
            </div>
        </div>

    </section>