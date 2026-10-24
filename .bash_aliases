#alias com="cat ~/.bash_aliases | grep \"$1\""
alias v="mpv --cache=no --geometry=600x1060-0+0 $1"
alias v1="xdotool getactivewindow windowsize --usehints  46 30 && xdotool getactivewindow windowmove 0 0 && tit v1"
alias v2=" xdotool getactivewindow windowsize --usehints  46 30 && xdotool getactivewindow windowmove $(($(xdotool getdisplaygeometry | awk '{print $1}') - $(xdotool getactivewindow getwindowgeometry --shell | grep WIDTH | cut -d= -f2))) %y && tit v2"
alias rapapor="scrcpy --no-video --audio-source=mic --audio-codec=flac --audio-buffer=300 --audio-codec-options=bitrate-mode=2 --record=audio_mic.flac"
alias micaudacity="PULSE_SINK=scrcpy_mic scrcpy --no-video --audio-source=mic --audio-codec=flac --audio-buffer=300 --audio-codec-options=bitrate-mode=2"
alias cap="scrcpy -s ZY32LWCM34 --audio-source=output --audio-codec=aac --audio-buffer=200 --max-fps=30 --video-codec=h264 --max-size=1080 --record=/home/ns/recs/cap.mp4"
alias capsd="scrcpy -s ZY32LWCM34 --audio-source=output --audio-codec=aac --audio-bitrate=128k --audio-buffer=200 --max-fps=30 --video-codec=h264 --video-bitrate=2.5M --max-size=1080 --record=/home/ns/recs/cap.mp4"
alias micscreen="PULSE_SINK=salida_celular scrcpy -s ZY32LWCM34 --audio-source=output --audio-codec=raw --audio-buffer=10 --video-codec=h264 --max-size=1080"
alias capcam="scrcpy  --video-source=camera --audio-source=mic --audio-codec=aac --record=/home/ns/recs/capcam.mp4"
alias e13ToObs="PULSE_SINK=scrcpy_mic scrcpy --video-source=camera   --camera-size=1920x1080   --audio-source=mic --audio-codec=aac   --v4l2-sink=/dev/video0"

alias capTikTok="scrcpy -s ZY32LWCM34 --audio-source=output --audio-codec=aac --audio-buffer=200 --max-fps=30 --video-codec=h264 --max-size=1080 --record=/home/ns/recs/cap.mp4"

alias g86MicToAudacityMono="SDL_AUDIODRIVER=pulseaudio PULSE_SINK=scrcpy_mic /home/ns/scrcpy_Lub16And16_folder/ejecutar.sh -s ZY32LWCM34 --audio-source=mic --audio-codec=opus --audio-codec-options=sample-rate=48000 --audio-buffer=120 --no-video"
alias g86OutPutToAudacityMono="SDL_AUDIODRIVER=pulseaudio PULSE_SINK=scrcpy_mic /home/ns/scrcpy_Lub16And16_folder/ejecutar.sh -s ZY32LWCM34 --audio-source=output --audio-codec=opus --audio-codec-options=sample-rate=48000 --audio-buffer=120 --no-video"
alias e13OnlyCamToObs="sudo modprobe -r v4l2loopback && sudo modprobe v4l2loopback exclusive_caps=1 card_label="scrcpy_cam" && scrcpy -s ZY22HHHZB3 --no-audio --video-source=camera --camera-size=1920x1080 --v4l2-sink=/dev/video0 --no-playback"
alias g86OnlyMicToObs="SDL_AUDIODRIVER=pulseaudio PULSE_SINK=scrcpy_mic scrcpy -s ZY32LWCM34 --audio-source=mic --audio-codec=opus --audio-codec-options=sample-rate=48000 --audio-buffer=120 --no-video"

alias g86ToMicObs="PULSE_SINK=scrcpy_mic scrcpy -s ZY32LWCM34 --audio-source=mic --audio-codec=aac --audio-buffer=60 --no-video"
alias testScrcpyMic=" vlc pulse://scrcpy_mic.monitor --demux=rawaud --rawaud-samplerate=44100 --rawaud-channels=2"
alias mice13="PULSE_SINK=scrcpy_mic scrcpy -s ZY22HHHZB3 --audio-source=mic --audio-codec=raw --audio-buffer=200 --no-video"
alias corte="/home/ns/tools/cortarMp4.sh $1 $2 $3 $4"


alias vcs="for i in {1..15}; do adb -s ZY32LWCM34 shell input keyevent 24; done"
alias vcb="for i in {1..15}; do adb -s ZY32LWCM34 shell input keyevent 25; done"

alias earspy="adb -s ZY32LWCM34 shell monkey -p com.nainfomatics.microphone.earspy -c android.intent.category.LAUNCHER 1"
alias fotocam="adb -s ZY32LWCM34 shell monkey -p com.hayhayapps.floatingtakephoto -c android.intent.category.LAUNCHER 1"

bc(){
    local busco="${1:-.}"
    COMANDO=$(grep "$busco" "$HOME/.bash_aliases")
    ALIAS=$(echo $COMANDO | cut -d' ' -f2 | cut -d'=' -f1)
    echo "$COMANDO"
    echo "Se copia alias: $ALIAS"
    echo "$ALIAS" | xclip
}

alias c="clear"

#Listar último archivo
lsu() {
    ls -t "${1:-.}" | head -n 1
}
#Copiar último archivo
lscu() {
    local target="${1:-.}"
    local ret=$(ls -t "$target" | head -n 1)

    if [ -z "$ret" ]; then
        echo "No se encontraron archivos en '$target'."
        return 1
    fi

    local full_path="mv '"$(realpath "$target/$ret")"' $PWD/"

    echo "Archivo: $full_path"
    echo -n "$full_path" | xclip -selection clipboard
    #gio trash "$full_path"
}
#Convetir el ultimo archivo a mp3
convmp3() {
    local target_dir="${1:-.}"
    local output_file="${2:-audio_convertido.mp3}"
    local ultimo_archivo
    ultimo_archivo=$(lsu "$target_dir")

    if [ -z "$ultimo_archivo" ]; then
        echo "No se encontraron archivos en '$target_dir'."
        return 1
    fi

    local input_path="$target_dir/$ultimo_archivo"
    input_path=$(echo "$input_path" | sed 's/\/\//\//g')

    # Aseguramos que termine en .mp3 si no se le especificó la extensión
    if [[ "$output_file" != *.mp3 ]]; then
        output_file="${output_file}.mp3"
    fi

    echo "Convirtiendo: $input_path -> $output_file"
    ffmpeg -i "$input_path" -vn -acodec libmp3lame -ab 192k "$output_file"
    echo "¡Listo!"
}

# Reduce la calidad de un archivo MP3 y genera uno nuevo con prefijo de kbps
# Uso: reducir_mp3 /ruta/al/archivo.mp3 56
redmp3() {
    local input_file="$1"
    local bitrate="${2:-64}"

    if [ ! -f "$input_file" ]; then
        echo "Error: El archivo '$input_file' no existe."
        return 1
    fi

    local dir_name=$(dirname "$input_file")
    local base_name=$(basename "$input_file")
    local name_no_ext="${base_name%.*}"

    local output_file="$dir_name/${name_no_ext}_${bitrate}kbps.mp3"

    echo "Comprimiendo a ${bitrate}k: $input_file -> $output_file"
    ffmpeg -i "$input_file" -b:a "${bitrate}k" "$output_file"
    echo "¡Proceso finalizado!"
}

tam() {
    local file="$1"

    if [ ! -f "$file" ]; then
        echo "Error: El archivo '$file' no existe."
        return 1
    fi

    # Obtenemos el tamaño en bytes usando stat y lo calculamos a MB con awk (2 decimales)
    stat -c "%s" "$file" | awk '{printf "%.2f MB\n", $1 / 1024 / 1024}'
}

alias mkvv="ffmpeg -loop 1 -i $1 -i $2 -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest $3"


alias u="unikey -folder=$PWD"
alias chau="sudo shutdown now"

#PROGRAMAS
alias op="/snap/bin/opera &> /dev/null 2>&1 &"
alias ff="GTK_THEME=Adwaita:dark firefox"
alias carp="GTK2_RC_FILES=~/.gtkrc-geany-dark caja $1"

function tit() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}
#Cambiar la resolución de la pantalla
alias r="/home/ns/gd/scripts/switchResPant.sh"
#Enviar ventana actual a otro escritorio
#alias e="wmctrl -r :ACTIVE: -t $1"
#Activar otro Escritorio
#alias x="wmctrl -s $1"
#Enviar ventana actual a otro escritorio y activar el escritorio especificado.
#alias ex="wmctrl -r :ACTIVE: -t $1" && "wmctrl -s $1"

#Copiar archivo al portapepeles
alias ca="xclip -selection clipboard < $1"
#Copiar archivo aab de zooland a gd/aabs
alias aab="~/gd/scripts/copyZoolandAABToHome.sh $1"
alias ap="~/gd/scripts/setSalidaAudio.sh 1"
alias ah="~/gd/scripts/setSalidaAudio.sh 2"
alias ds="cd /home/ns/nsp/zool-server && sudo docker run -p 8100:8101 -it -v .:/root/zool-server ubuntu-zool-server"
alias fs="~/gd/scripts/findStringInFilesInFolderAndSubFolders.sh $1 $2"
alias des="/home/ns/gd/scripts/descargarAMP3ParaWhatsAppYt-dlp.sh $1"
alias comint="~/gd/misapps/comint/init.sh"
alias nico="~/gd/misapps/comint/stop.sh"
alias pv="~/gd/scripts/misLinuxScriptInit.sh"
alias apk="mv $1/android-build//build/outputs/apk/release/android-build-release-signed.apk $2"
alias ms="pactl load-module module-loopback latency_msec=1"
alias mn="pactl unload-module module-loopback"
alias p="pulseaudio -k"
alias snippets="cp /home/ns/gd/scripts/qml.xml /media/ns/Archivos/Qt5.14.2/Tools/QtCreator/share/qtcreator/snippets/"
alias lyt="sh /home/ns/Documentos/gd/scripts/linkYtToWav.sh $1 $2"
alias rt="sh /home/ns/Documentos/gd/scripts/retransmitirDevVideo.sh $1 $2 $3"
alias setvnf="echo $1 > /home/ns/Documentos/gd/zool_docs/visor-notas/currentFile.txt"
alias vnf="unik -folder='/home/ns/Documentos/gd/zool_docs/visor-notas'"
alias tl="setxkbmap latam"
alias qt="~/Qt/Tools/QtCreator/bin/qtcreator &"
alias turnos="clear && cat ~/Escritorio/turnos.txt"
alias cn="unik -folder=/home/ns/nsp/uda/mercurio '$1' '$2' '$3' '$4' '$5'"

alias tm="unik -folder=/media/nextsigner/ZONA-A1/nsp/unik-dev-apps/avisos $1 $2 $3 $4 $5"
alias ytm="sh /media/nextsigner/ZONA-A1/ricardo__martin/scripts/ytm.sh"
alias ravd="~/Android/Sdk/tools/emulator -avd Android_9_API_28"
alias runik="unik -folder=$PWD"

alias aunik="cd /media/nextsigner/ZONA-A1/nsp/unik"
#alias aunikh="cd /media/nextsigner/ZONA-A12/nsp/unik && git fetch --all && git reset --hard origin/master && git pull origin master"
#alias ah="echo $(history | grep "$1" -m 1) > \"/tmp/cccc\" && clear && xdotool type --delay 15 $(cut -c6-1000 < /tmp/cccc)"

#alias u="unik -folder=$PWD"
alias h="history | grep $1"
alias ar="sudo alsa force-reload"
alias ec="sudo modprobe v4l2loopback && ffmpeg -f x11grab -r 15 -s 1280x720 -i :0.0+0,0 -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0"
alias ada="cd /home/ns/nsp/uda"
alias az="cd /media/ns/Z*/zool && pwd && git status && echo 'Este repositorio opera con main'"
alias rz="./release.sh $1"
alias aq="cd /home/ns/nsp/uda/quiron  && pwd && git status && echo 'Este repositorio opera con master'"
alias ag="cd /home/ns/Documentos/gd/ && pwd"
alias o="sudo killall obs && sudo killall unik && obs &"
alias ts="/bin/bash /home/ns/Documentos/gd/scripts/resetTwitchChatSpeech.sh"

alias lt1="lt --port 8080 | sed 's/your url is: //g' > logiteca1"
alias lt2="lt --port 8081 | sed 's/your url is: //g' > logiteca2"
alias rs="ada && cd logiteca && npm start"


alias g='getUnikQmlComponent'
function getUnikQmlComponent(){
	wget https://raw.githubusercontent.com/nextsigner/unik-qml-components/master/$(echo "$1").qml
}
#alias audio="pulseaudio -k && sudo alsa force-reload && pulseaudio --kill; pulseaudio --start"
alias audio="pulseaudio -k && sudo alsa force-reload"
alias d="git diff origin/master --name-only"

alias lzool="cat ~/link_zool | xclip"

alias ghk="cat ~/.ghk | xclip"
alias s='subirGit $1'
function subirGit() {
    echo "$1" > ucommit.txt
    ghk
    git add *;
    git commit -m "$(echo "$1")";
    git push origin $2;
}

function setNtc(){
dconf write /org/mate/desktop/keybindings/custom0/action "'$(echo "unik -folder="$PWD)'"
dconf write /org/mate/desktop/keybindings/custom0/command "'$(echo "unik -folder="$PWD)'"
dconf write /org/mate/desktop/keybindings/custom0/binding "'<Ctrl><Shift>r'"
dconf write /org/mate/desktop/keybindings/custom0/name "'$(echo "unik -folder="$PWD)'"
echo "Combinaciòn de tecla creada: unik -folder="$PWD	
}

alias nrg='nrg'
function ngr(){
	F=$(pwd | rev | sed 's/\//\@/g' | cut -d'@' -f1 | rev)
	echo "# "$F >> README.md
	echo "node_modules/*" >> .gitignore
	git init
	git add README.md
	git add .gitignore
	git commit -m "first commit"
	git branch -M main
	git remote add origin git@github.com:nextsigner/$F.git
	git push -u origin main
}
function setUnikFileSystem(){
        sudo rm /usr/local/bin/unik
        sudo ln $(echo "$1") /usr/local/bin/unik
}

alias os="obs &> /dev/null &"
alias zool="unikey -folder=/home/ns/nsp/zoolv4 &> /dev/null &"
alias geany-dark='GTK2_RC_FILES=~/.gtkrc-geany-dark geany &'
alias dlp="LD_LIBRARY=/home/ns/python310/lib LD_LIBRARY_PATH=/home/ns/openssl/lib yt-dlp"
alias p3="LD_LIBRARY=/home/ns/python310/lib LD_LIBRARY_PATH=/home/ns/openssl/lib /home/ns/python310/bin/python3"
alias bt="GTK_THEME=Adwaita:dark blueman-manager"
alias pc="GTK_THEME=Adwaita:dark pavucontrol"
alias ar-usb='adb forward --remove-all && adb reverse --remove-all && adb reverse tcp:59100 tcp:59100'
