<?php

Route::get('team/list', 'index/team/list');
Route::post('team/add', 'index/team/add');

Route::get('player/list', 'index/player/list');
Route::get('player/:id', 'index/player/getPlayerById');
Route::post('player/add', 'index/player/add');

Route::post('match/add', 'index/match/add');
Route::post('match/modify_score', 'index/match/changeScore');
Route::get('match/list', 'index/match/get3DayMatch');
Route::get('match/get_match/:id', 'index/match/getMatchById');

Route::post('live/add', 'index/commentary/add');
Route::get('live/list/:match_id', 'index/commentary/getRecode');
