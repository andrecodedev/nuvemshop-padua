{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
{% set has_footer_contact_info = (store.whatsapp or store.phone or store.email or store.address or store.blog) and settings.footer_contact_show %}          

{% set has_footer_menu = settings.footer_menu and settings.footer_menu_show %}
{% set has_footer_menu_secondary = settings.footer_menu_secondary and settings.footer_menu_secondary_show %}
{% set has_footer_about = settings.footer_about_show and (settings.footer_about_title or settings.footer_about_description) %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_logos = settings.shipping %}
{% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}

{% set has_seal_logos = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
{% set show_help = not has_products and not has_social_network %}
<footer class="js-hide-footer-while-scrolling footer-block display-when-content-ready" data-store="footer">
	<div class="container-fluid px-md-5">
		<div class="row element-footer">
			
			{% if template != 'password' %}

				{# About #}
				{% if has_footer_about %}

					<div class="col-12 col-md-5 mb-4 footer-logo">
						{{ component('logos/logo', {logo_img_classes: 'transition-soft ' ~ logo_size_class, logo_text_classes: ''}) }}

						{% if settings.footer_about_title %}
							<h4 class="h3" style="max-width:320px;">{{ settings.footer_about_title }}</h4>
						{% endif %}
						{% if settings.footer_about_description %}
							<p style="max-width:320px;">{{ settings.footer_about_description }}</p>
						{% endif %}
					</div>

				{% endif %}
				<div class="col">
					<div class="row">
						{# Foot Nav #}
						{% if has_footer_menu %}
							<div class="col-12 col-md-4">
								{% if settings.footer_menu_title %}
									<h4 class="h3">{{ settings.footer_menu_title }}</h4>
								{% endif %}
								{% include "snipplets/navigation/navigation-foot.tpl" %}
							</div>
						{% endif %}

						{# Foot Nav Secondary #}
						{% if has_footer_menu_secondary %}
							<div class="col-12 col-md-4">
								{% if settings.footer_menu_secondary_title %}
									<h4 class="h3">{{ settings.footer_menu_secondary_title }}</h4>
								{% endif %}
								{% include "snipplets/navigation/navigation-foot-secondary.tpl" %}
							</div>
						{% endif %}
						<div class="col-12 col-md-4 -newsletter">
							<h4 class="h3">NEWSLETTER</h4>
							{% if contact and contact.type == 'newsletter' %}
								{% if contact.success %}
									<div class="alert alert-success">{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
								{% else %}
									<div class="alert alert-danger">{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
								{% endif %}
							{% endif %}

							<form class="mt-3" method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" data-store="newsletter-form">
								<div class="input-append">

									{% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_placeholder: 'Email' | translate, input_custom_class: "form-control-big", input_aria_label: 'Email' | translate } %}
									{% endembed %}

								<div class="winnie-pooh" style="display: none;">
									<label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
									<input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
								</div>
								<input type="hidden" name="name" value="{{ "Sin nombre" | translate }}" />
								<input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
								<input type="hidden" name="type" value="newsletter" />
								<input type="submit" name="contact" class="btn newsletter-btn" value="" />
								<svg width="11" height="11" viewBox="0 0 11 11" fill="none" xmlns="http://www.w3.org/2000/svg">
									<path d="M10.3125 5.92188L6.1875 9.85938C5.95312 10.0703 5.60156 10.0703 5.39062 9.83594C5.17969 9.60156 5.17969 9.25 5.41406 9.03906L8.53125 6.0625H0.5625C0.234375 6.0625 0 5.82812 0 5.5C0 5.19531 0.234375 4.9375 0.5625 4.9375H8.53125L5.41406 1.98438C5.17969 1.77344 5.17969 1.39844 5.39062 1.1875C5.60156 0.953125 5.97656 0.953125 6.1875 1.16406L10.3125 5.10156C10.4297 5.21875 10.5 5.35938 10.5 5.5C10.5 5.66406 10.4297 5.80469 10.3125 5.92188Z" fill="white"/>
								</svg>							
								</div>
							</form>
							<div class="row{% if template == 'password' %} text-center{% endif %}">
								<div class="col-12 mb-4{% if template == 'password' %} text-center{% endif %}">
									{# Social #}
									{% include "snipplets/social/social-links.tpl" with {'circle': true} %}
								</div>
							</div>
						</div>
					{% endif %}
					
					{# Social #}
				</div>
			</div>
		</div>

		{% if template != 'password' %}

			{% if has_shipping_payment_logos or has_seal_logos %}

				<div class="divider mb-5"></div>

				<div class="row element-footer">

					{# Logos Payments and Shipping #}
			 		{% if has_shipping_payment_logos %}
			 			<div class="col-md-9">
				 			<div class="footer-payments-shipping-logos">
				 				{% if has_payment_logos %}
				 					<div class="row mb-4">
				 						<div class="col-md-4">
					 						<h4 class="h3">{{ "Medios de pago" | translate }}</h4>
					 					</div>
					 					<div class="col-md-8">
					 						{% include "snipplets/logos-icons.tpl" with {'payments': true} %}
					 					</div>
				 					</div>
								{% endif %}
				 				{% if has_shipping_logos %}
				 					<div class="row mb-4">
					 					<div class="col-md-4">
					 						<h4 class="h3">{{ "Medios de envío" | translate }}</h4>
					 					</div>
					 					<div class="col-md-8">
					 						{% include "snipplets/logos-icons.tpl" with {'shipping': true} %}
					 					</div>
				 					</div>
				 				{% endif %}
							</div>
						</div>
					{% endif %}

					{# AFIP - EBIT - Custom Seal #}
					{% if has_seal_logos %}
		 				<div class="col-md-3">
		 					{% if store.afip %}
		                        <div class="footer-logo afip seal-afip">
		                            {{ store.afip | raw }}
		                        </div>
		                    {% endif %}
		                    {% if ebit %}
		                        <div class="footer-logo ebit seal-ebit">
		                            {{ ebit }}
		                        </div>
		                    {% endif %}
		                    {% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
			                    {% if "seal_img.jpg" | has_custom_image %}
			                        <div class="footer-logo custom-seal">
			                            {% if settings.seal_url != '' %}
			                                <a href="{{ settings.seal_url | setting_url }}" target="_blank">
			                            {% endif %}
			                            	{% set seal_image = "seal_img.jpg" | static_url %}
			                                <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ seal_image | settings_image_url('large') }}" class="custom-seal-img lazyload" alt="{{ 'Sello de' | translate }} {{ store.name }}" />
			                            {% if settings.seal_url != '' %}
			                                </a>
			                            {% endif %}
			                        </div>
			                    {% endif %}
			                    {% if settings.custom_seal_code %}
			                        <div class="footer-logo custom-seal custom-seal-code">
			                            {{ settings.custom_seal_code | raw }}
			                        </div>
			                    {% endif %}
				            {% endif %}

		 				</div>
					{% endif %}

				</div>

			{% endif %}

		{% endif %}
	</div>
	<div class="linear-footer"></div>

	<div class="js-footer-legal footer-legal pb-5">
		<div class="container-fluid px-md-5 pb-2">
			<div class="row">

	            <div class="col-md-9 text-md-left mb-3 mb-md-0">
	                <div class="d-inline-block mr-md-2 " style="font-size: 9px; margin-left:10px; color: #ccc;">
	                   {{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
	                </div>
	                {{ component('claim-info', {
							container_classes: "d-md-inline-block mt-md-0 mt-3",
							divider_classes: "mx-1",
							text_classes: {text_consumer_defense: 'd-inline-block mb-1'},
							link_classes: {
								link_consumer_defense: "font-weight-bold",
								link_order_cancellation: "font-weight-bold",
							},
						}) 
					}}
					<a href="https://www.tec4udigital.com" target="top" class="font-semibold" style="align-items: center;gap: 7px;font-size: 9px; margin-left:10px; color: #ccc;">
						Desenvolvido por 
						<span>TEC4U Digital</span>
					</a>
	            </div>

				<div class="col-md text-left text-md-right">
	                {#
	                La leyenda que aparece debajo de esta linea de código debe mantenerse
	                con las mismas palabras y con su apropiado link a Tienda Nube;
	                como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
	                Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
	                tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
	                Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
	                palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
	                http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
	                e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
	                manter visivél e com um link funcionando.
	                #}
	                {{ new_powered_by_link }}
	            </div>
	        </div>
    	</div>
    </div>
</footer>
