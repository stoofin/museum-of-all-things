@tool
extends MeshInstance3D

@export var no_light: bool = false
@export var title_color: Color = Color.WHITE
@export var hide_titles: bool = false
@export var title_text = "Art"
@export var subtitle_text = "Featured Art Exhibits"

var max_title_length_px = 320

func _ready() -> void:
  if no_light:
    $MeshInstance3D.visible = false
    $SpotLight3D.visible = false

  if hide_titles:
    $Title.visible = false
    $Subtitle.visible = false
  else:
    $Title.modulate = title_color
    $Title.text = title_text
    $Subtitle.modulate = title_color
    $Subtitle.text = subtitle_text
    if not Engine.is_editor_hint():
      Util.resizeTextToPx($Title, max_title_length_px)
