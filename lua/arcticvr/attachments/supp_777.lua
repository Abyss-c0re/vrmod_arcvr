local att = {}

att.Name = "supp_777"
att.PrintName = "M4A1 Suppressor"
att.Category = "Arctic VR CS Attachments"
att.Bone = "muzzle"
att.Slot = "CSmuzz"
att.Model = "models/weapons/csattachments/m4supp.mdl"

att.OverrideMuzzle = true
att.MuzzleEffectOverride = "AirboatMuzzleFlash"
att.MuzzleEffectAngle = Angle(90, 0, 0)
att.Silencer = true

att.Buff_ShotVolume = 0.85
att.Buff_Recoil = 1.15
att.Buff_MuzzleVelocity = 1.1
att.Buff_Spread = 0.9
att.Buff_MaxRange = 1.15

att.Buff_WeightPenaltyFrames = 2

ArcticVR.LoadAttachmentType(att)