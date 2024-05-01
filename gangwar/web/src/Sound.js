export function Sound(name) {
    const audio = new Audio()
    audio.src = `./sounds/${name}`
    audio.play()
    audio.Volume = 0.1
}