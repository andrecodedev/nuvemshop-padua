{% set use_defaults = not settings.disable_defaults_site and not settings.disable_defaults_homepage %}

{% set video_embed = settings.video_embed|default('') %}
{% if use_defaults %}
    {% set video_title = settings.video_title|default('Confira nosso vídeo') %}
    {% set video_text  = settings.video_text|default('Veja novidades e dicas em nosso canal.') %}
{% else %}
    {% set video_title = settings.video_title|default('') %}
    {% set video_text  = settings.video_text|default('') %}
{% endif %}

<div class="js-home-video-container container{% if settings.video_full %}-fluid p-0{% endif %}">
    <div class="row no-gutters">
        <div class="col-md-8 offset-md-2 text-center">
            <h2 class="h1 js-home-video-title {% if settings.theme_rounded %}text-primary{% endif %}">{{ video_title }}</h2>
            <p class="mb-5 js-home-video-text">{{ video_text }}</p>
        </div>
        <div class="col-12 js-home-video" data-video-color="{{ settings.primary_color | trim('#') }}">
            {% if video_embed %}
                {% include 'snipplets/video-item.tpl' %}
            {% else %}
            {% if use_defaults %}
                <div class="video-placeholder position-relative">
                    <img src="https://placehold.co/1200x500?text=1200x500 : Video" alt="{{ video_title }}" class="w-100" />
                    <div class="video-play-overlay" style="position:absolute;left:50%;top:50%;transform:translate(-50%,-50%);font-size:48px;color:#fff;opacity:0.9;">&#9658;</div>
                </div>
            {% endif %}
            {% endif %}
        </div>
    </div>
</div>
