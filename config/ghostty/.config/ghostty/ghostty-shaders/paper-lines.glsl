
/** Distance between lines in pixels */
float resolution = 37.0;

/** Line thickness in pixels */
float thickness = 1.0;

/** Strength of effect (0..1) — how much to darken the line */
float strength = 0.25;

/** Optional vertical offset (in pixels) */
float phase = 0.0;

void _scanline(inout vec3 color, vec2 uv)
{
    // y in pixels, wrapped to [0, resolution)
    float y = mod(uv.y * iResolution.y - phase, resolution);

    // 0 inside the thin line band, 1 elsewhere (like your grid logic)
    float mask = step(thickness, y);

    // darken only on the line band
    color = mix(color * (1.0 - strength), color, mask);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv   = fragCoord.xy / iResolution.xy;
    vec3 color = texture(iChannel0, uv).rgb;

    _scanline(color, uv);

    fragColor.xyz = color;
    fragColor.w   = 1.0; // same as your sample: force opaque so the line is visible
}

