{% set use_defaults = not settings.disable_defaults_site and not settings.disable_defaults_footer %}
<section class="section-welcome-home" data-store="home-welcome-message">
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2 text-center">
                <h2 class="h1 js-welcome-message-title">
                    {{ use_defaults ? 'Escreva sobre a sua marca' : (settings.welcome_message|default('')) }}
                </h2>
                <p class="js-welcome-message-text">
                    {{ use_defaults ? 'Encontre produtos selecionados e ofertas especiais.' : (settings.welcome_text|default('')) }}
                </p>
            </div>
        </div>
    </div>
</section>
