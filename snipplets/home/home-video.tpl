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
                {# CÓDIGO PERSONALIZADO PARA AUTOPLAY #}
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe id="home-autoplay-video"
                            class="embed-responsive-item"
                            src=""
                            frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen>
                    </iframe>
                </div>

                <script>
                    (function() {
                        var rawUrl = "{{ video_embed }}";
                        var iframe = document.getElementById('home-autoplay-video');
                        var finalSrc = "";

                        // Lógica para extrair ID do YouTube e montar URL com Autoplay + Mute
                        if (rawUrl.indexOf('youtube') !== -1 || rawUrl.indexOf('youtu.be') !== -1) {
                            var videoId = "";
                            if (rawUrl.indexOf('v=') !== -1) {
                                videoId = rawUrl.split('v=')[1].split('&')[0];
                            } else if (rawUrl.indexOf('youtu.be/') !== -1) {
                                videoId = rawUrl.split('youtu.be/')[1].split('?')[0];
                            } else if (rawUrl.indexOf('embed/') !== -1) {
                                videoId = rawUrl.split('embed/')[1].split('?')[0];
                            }

                            if (videoId) {
                                // mute=1 é OBRIGATÓRIO para autoplay funcionar no Chrome/Mobile
                                finalSrc = "https://www.youtube.com/embed/" + videoId + "?autoplay=1&mute=1&loop=1&playlist=" + videoId + "&controls=1&showinfo=0&rel=0&enablejsapi=1&modestbranding=1";
                            }
                        }
                        // Lógica para Vimeo
                        else if (rawUrl.indexOf('vimeo') !== -1) {
                            var parts = rawUrl.split('/');
                            var videoId = parts[parts.length - 1];
                            if (videoId) {
                                finalSrc = "https://player.vimeo.com/video/" + videoId + "?autoplay=1&muted=1&loop=1&background=1";
                            }
                        }

                        // Define o SRC final se encontrou um ID válido, senão usa o original
                        if (iframe) {
                            iframe.src = finalSrc || rawUrl;
                        }
                    })();
                </script>
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
