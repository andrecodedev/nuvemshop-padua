{% set use_defaults = not settings.disable_defaults_site and not settings.disable_defaults_homepage %}

{% embed "snipplets/modal.tpl" with{
    modal_id: 'home-modal',
    modal_position: 'bottom',
    modal_transition: 'slide',
    modal_header: false,
    modal_footer: false,
    modal_width: 'centered',
    modal_class: 'centered-small bg-primary',
    modal_close_class: 'invert'
} %}

    {% block modal_body %}

        {# ===============================
           Preparação dos valores com defaults
        =============================== #}

        {% set has_popup_image = "home_popup_image.jpg" | has_custom_image %}
        {% set home_popup_image = "home_popup_image.jpg" | static_url %}

        {# Texto com default apenas quando use_defaults = true #}
        {% set home_popup_txt =
            settings.home_popup_txt
            | default(use_defaults ? 'Aproveite nossas ofertas exclusivas!' : '')
        %}

        {# URL com default somente se defaults estiverem ativos #}
        {% set home_popup_url =
            settings.home_popup_url
            | default(use_defaults ? '#' : '')
        %}

        {# Newsletter com default ativado apenas se use_defaults = true #}
        {% set home_news_box =
            settings.home_news_box
            | default(use_defaults ? true : false)
        %}

        {# ===============================
           IMAGEM DO POPUP
        =============================== #}

        {% if has_popup_image %}
            {% if home_popup_url %}
                <a href="{{ home_popup_url | setting_url }}">
            {% endif %}
                <img
                    src="{{ 'images/empty-placeholder.png' | static_url }}"
                    data-srcset="{{ home_popup_image | settings_image_url('huge') }} 640w, {{ home_popup_image | settings_image_url('original') }} 1024w"
                    class="lazyload fade-in modal-img-full"
                    alt="Popup"
                />
            {% if home_popup_url %}
                </a>
            {% endif %}
        {% else %}
            {% if use_defaults %}
                <img
                    src="https://placehold.co/620x320?text=620x320+:+Popup+Image"
                    class="lazyload fade-in modal-img-full"
                    alt="Popup padrão"
                />
            {% endif %}
        {% endif %}


        {# ===============================
           CONTEÚDO DE TEXTO + NEWSLETTER
        =============================== #}

        {% if home_popup_txt or home_news_box %}
        <div class="row align-items-center {% if not has_popup_image %}mt-3{% endif %}">

            {# --- Texto do popup --- #}
            <div class="col-12">
                {% if home_popup_url %}
                    <a href="{{ home_popup_url | setting_url }}" style="background-color: transparent; color: #000;">
                {% endif %}
                        <h3 class="text-left mt-3">{{ home_popup_txt }}</h3>
                {% if home_popup_url %}
                    </a>
                {% endif %}
            </div>

            {# --- Newsletter --- #}
            {% if home_news_box %}
                <div class="col-12 newsletter">
                    <div id="news-popup-form-container">
                        <form id="news-popup-form" method="post" action="/winnie-pooh" class="js-news-form" data-store="newsletter-form-popup">
                            <div class="input-append">

                                {% embed "snipplets/forms/form-input.tpl" with{
                                    input_for: 'email',
                                    type_email: true,
                                    input_name: 'email',
                                    input_id: 'email',
                                    input_placeholder: 'Email',
                                    input_custom_class: "js-mandatory-field form-control-big",
                                    input_aria_label: 'Email' | translate
                                } %}
                                {% endembed %}

                                <div class="winnie-pooh" style="display: none;">
                                    <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                                    <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
                                </div>

                                <input type="hidden" name="name" value="{{ "Sin nombre" | translate }}" />
                                <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
                                <input type="hidden" name="type" value="newsletter" />

                                <button type="submit" name="contact" class="js-news-popup-submit btn newsletter-btn" value="CADASTRAR">
                                    <span class="js-news-send">CADASTRAR</span>
                                </button>

                                <span class="js-news-spinner" style="display: none;">
                                    <svg class="icon-inline newsletter-btn svg-icon-primary icon-spin">
                                        <use xlink:href="#circle-notch"/>
                                    </svg>
                                </span>
                            </div>

                            <div style='display: none;' class="js-news-spinner h6 text-center m-top"></div>
                            <div style='display: none;' class="js-news-popup-success alert alert-success">
                                {{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}
                            </div>
                            <div style='display: none;' class="js-news-popup-failed alert alert-danger">
                                {{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}
                            </div>
                        </form>

                        <p class="infos-newsletter">
                            Ao clicar em "Cadastrar" você autoriza receber nossa newsletter e concorda com as políticas de privacidade do nosso site.
                        </p>
                    </div>
                </div>
            {% endif %}
        </div>
        {% endif %}

    {% endblock %}
{% endembed %}
