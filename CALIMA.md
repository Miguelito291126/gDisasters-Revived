# Problema: Entidades del clima no se eliminan al hacer "Clean Map"

## ¿Por qué ocurre este problema?

El addon **gDisasters-Revived** modifica el comportamiento de `CleanUpMap` para que también elimine las entidades climáticas (`env_skypaint` y `light_environment`). Sin embargo, estas entidades son inmediatamente recreadas automáticamente.

### El ciclo:

1. **InitPostEntity Hook** - Se ejecuta al limpiar el mapa
   - Sobrescribe la función nativa de `CleanUpMap` 
   - Agrega `"env_skypaint"` y `"light_environment"` a las entidades por eliminar
   
2. **Entidades climáticas se eliminan** ✅

3. **PostInit Hook** - Se ejecuta inmediatamente después
   ```lua
   hook.Add("PostInit", "gDisastersRevivedInitFix", function()
       if GetConVar("gdisasters_revived_graphics_atmosphere"):GetInt() >= 1 then 
           if #ents.FindByClass("env_skypaint") < 1 then
               local ent = ents.Create("env_skypaint")
               ent:SetPos(Vector(0,0,0))
               ent:Spawn()
           end
       end
   end)
   ```

4. **Resultado**: Las entidades se crean de nuevo automáticamente

## Solución

### Opción 1: Desactivar el sistema atmosférico temporalmente

```lua
// En consola antes de limpiar:
sv_gdisasters_revived_graphics_atmosphere 0
cleanmap
sv_gdisasters_revived_graphics_atmosphere 1
```

### Opción 2: Crear una función personalizada para eliminar todo incluido

```lua
function gDisasters_Revived.CleanMapComplete()
    local weather = ents.FindByClass("env_weather")
    for _, w in pairs(weather) do
        w:Remove()
    end
    
    local particles = ents.FindByClass("particle_system")
    for _, p in pairs(particles) do
        p:Remove()
    end
    
    local skyPaint = ents.FindByClass("env_skypaint")
    for _, s in pairs(skyPaint) do
        s:Remove()
    end
    
    local lights = ents.FindByClass("light_environment")
    for _, l in pairs(lights) do
        l:Remove()
    end
end

// Ejecutar en consola:
gdisasters_reviived.CleanMapComplete
```

### Opción 3: Reiniciar el servidor (solución definitiva)

Como las entidades son recreadas automáticamente, la única manera de eliminarlas permanentemente es reiniciando el servidor del mod.

## Ubicación del código relevante

- Archivo: `lua/gdisasters/game/sv_world_init.lua`
- Hook: `InitPostEntity` - Sobrescribe CleanUpMap
- Archivo: `lua/gdisasters/atmosphere/sv_main.lua`  
- Hook: `PostInit` - Recrea env_skypaint si desaparece
