extends CSGBox3D


var songs := [
preload("res://Paul Russell - Lil Boo Thang (Lyric Video).mp3"),
preload("res://bbno$ - check (official music video).mp3"),
preload("res://Wolves of the Revolution.mp3"),
preload("res://100 gecs - stupid horse (Official Audio Stream).mp3"),
preload("res://Among Us Drip Theme Song Original (Among Us Trap Remix Amogus Meme Music).mp3"),
preload("res://Cha Cha Cha.mp3"),
preload("res://I am a horse #horse #funnysong.mp3"),
preload("res://Lil Nas X, Jack Harlow - INDUSTRY BABY (Official Video).mp3"),
preload("res://MiniMusicMan - Crazy La Paint (Markiplier Outro 2015).mp3"),
preload("res://Revenge - A Minecraft Parody of Usher's DJ Got Us Fallin' In Love (Music Video).mp3"),
preload("res://SPEED OF HELL.mp3"),
preload("res://TVアニメドロヘドロノンクレジットオープニング映像 (K)NoWNAMEWelcome トゥ 混沌(カオス).mp3"),
preload("res://TVアニメ戦隊大失格ノンクレジットEDムービーTBS系全国28局ネットにて毎週日曜午後4時30分から放送中ディズニープラスにて毎週日曜17_00より配信中.mp3"),
preload("res://TVアニメ戦隊大失格ノンクレジットOPムービーTBS系全国28局ネットにて毎週日曜午後4時30分から放送中ディズニープラスにて毎週日曜17_00より配信中.mp3"),
preload("res://Yukopi - Powerful Wind, Slicked-back Hair유코피 강풍 올백 머리ゆこぴ強風オールバック.mp3"),
preload("res://おつかれSUMMER.mp3"),
preload("res://ハチ - ドーナツホール 2024 , HACHI - DONUT HOLE 2024.mp3")
]


@onready var forward_button = $"../CSGBox3D3"
@onready var audio_player = $"../AudioStreamPlayer3D"

var number = 0

func interact():
	
	number = number - 1
	
	if number <= -1:
		number = 16
		
	
	forward_button.number = number
	
	audio_player.stream = songs[number]
	audio_player.play()
	
	
	
