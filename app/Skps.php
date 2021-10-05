<?php

namespace App;

use Eloquent;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Skps extends Model
{
    protected $primaryKey = 'nip_rated';
    public $incrementing = false;
    protected $fillable = [
        'nip_rated',
        'periode_id',
        'rated_unit_id',
        'rated_position_id',
        'rated_rankgroup_id',
        'commitment',
        'discipline',
        'cooperation',
        'leadership',
        'integrity',
        'service_oriented',
        'objection_rated',
        'response_evaluator',
        'superior_ decision',
        'recommendation',
        'date_given_to_superiors',
        'evaluator_rankgroup_id',
        'nip_evaluator',
        'evaluator_unit_id',
        'evaluator_position_id'
    ];

    public static function user_name()
    {
        return  DB::table('skps')
            ->select(
                DB::raw("(SELECT name as penilai FROM users WHERE nip= skps.nip_evaluator) as penilai"),
                DB::raw("(SELECT name as dinilai FROM users WHERE nip= skps.nip_rated) as dinilai"),
                DB::raw("(SELECT start_date as tgl_mulai FROM periodes WHERE id=periode_id) as tgl_mulai"),
                DB::raw("(SELECT finish_date as tgl_selesai FROM periodes WHERE id=periode_id) as tgl_selesai"),
                DB::raw("(SELECT name as posisi_dinilai FROM positions WHERE id=rated_position_id) as posisi_dinilai"),
                DB::raw("(SELECT name as posisi_penilai FROM positions WHERE id=evaluator_position_id) as posisi_penilai"),
                DB::raw("(SELECT name as panggol_dinilai FROM rank_groups WHERE id=rated_rankgroup_id) as panggol_dinilai"),
                DB::raw("(SELECT name as panggol_penilai FROM rank_groups WHERE id=evaluator_position_id) as panggol_penilai"),
                DB::raw("(SELECT name as unit_dinilai FROM units WHERE id=rated_unit_id) as unit_dinilai"),
                DB::raw("(SELECT name as unit_penilai FROM units WHERE id=evaluator_unit_id) as unit_penilai"),
                DB::raw("(SELECT activities as aktifitas FROM targets WHERE nip_rated=skps.nip_rated) as aktifitas"),
                DB::raw("(SELECT credit_number as angka_kredit FROM targets WHERE nip_rated=skps.nip_rated) as angka_kredit"),
                DB::raw("(SELECT ak as ak FROM targets WHERE nip_rated=skps.nip_rated) as ak"),
                DB::raw("(SELECT quantity as kuant FROM targets WHERE nip_rated=skps.nip_rated) as kuant"),
                DB::raw("(SELECT mutu as mutu FROM targets WHERE nip_rated=skps.nip_rated) as mutu"),
                DB::raw("(SELECT time as waktu FROM targets WHERE nip_rated=skps.nip_rated) as waktu"),
                DB::raw("(SELECT cost as biaya FROM targets WHERE nip_rated=skps.nip_rated) as biaya"),
                DB::raw("(SELECT name as output FROM outputs WHERE id='(SELECT output_id FROM targets WHERE nip_rated=skps.nip_rated)') as output"),
                'skps.*'
            );
    }

    // {
    //     return $this->belongsTo('app/User', 'nip_rated');
    // }
    // public function users_nip_evaluator()
    // {
    //     return $this->belongsTo('app/User', 'nip_evaluator');
    // }
    // public function target()
    // {
    //     return $this->belongsTo('app/User', 'nip_rated');
    // }

    // public function periode_id_periode()
    // {
    //     return $this->belongsTo('app/Periode', 'periode_id');
    // }

    // public function position_rated_position()
    // {
    //     return $this->belongsTo('app/Position', 'rated_position_id');
    // }

    // public function position_evaluator_position()
    // {
    //     return $this->belongsTo('app/Position', 'evaluator_position_id');
    // }

    // public function rankgroup_rated_rankgroup()
    // {
    //     return $this->belongsTo('app/RankGroup', 'rated_rankgroup_id');
    // }
    // public function rankgroup_evaluator_rankgroup()
    // {
    //     return $this->belongsTo('app/RankGroup', 'evaluator_rankgroup_id');
    // }

    // public function unit_rated_unit()
    // {
    //     return $this->belongsTo('app/Unit', 'rated_unit_id');
    // }
    // public function unit_evaluator_unit()
    // {
    //     return $this->belongsTo('app/Unit', 'evaluator_unit_id');
    // }
}
