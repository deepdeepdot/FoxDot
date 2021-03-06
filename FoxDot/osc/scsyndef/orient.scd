SynthDef.new(\orient,
{|vib=0, rel=0.01, bus=0, rate=0, verb=0.7, peak=1, amp=1, freq=0, beat_dur=1, room=10, decay=0.01, level=0.8, atk=0.01, sus=1, fmod=0, blur=1, pan=0|
var osc, env;
sus = sus * blur;
freq = In.kr(bus, 1);
freq = [freq, freq+fmod];
osc=(LFPulse.ar(freq, 0.5, 0.25, 0.25) + LFPulse.ar(freq, 1, 0.1, 0.25));
env=EnvGen.ar(Env.perc(level: amp,curve: 0,attackTime: 0.01,releaseTime: sus), doneAction: 0);
osc=(osc * env);
osc = Mix(osc) * 0.5;
osc = Pan2.ar(osc, pan);
	ReplaceOut.ar(bus, osc)}).add;
