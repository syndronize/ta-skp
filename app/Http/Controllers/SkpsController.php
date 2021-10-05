<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Skps;
use App\User;
use App\Position;
use App\RankGroup;
use App\Periode;
use App\Unit;
use Illuminate\Support\Facades\Validator;

class SkpsController extends Controller
{

    public function index()
    {
        // $data['user'] = User::with('skps_nip_rated', 'skps_nip_evaluator')
        //     ->get();
        // $data['periode'] = Periode::with('periode_skps')
        //     ->get();
        // $data['position'] = Position::with('skps_rated_position', 'skps_evaluator_position')
        //     ->get();
        // $data['rankgruop'] = RankGroup::with('skps_rated_rankgroup', 'skps_evaluator_rankgroup')->get();
        // $data['unit'] = Unit::with('skps_rated_unit', 'skps_evaluator_unit')->get();
        // $data['skps'] = DB::table('skps')->get();
        // // dd($data);
        $data['user'] = Skps::user_name()->get();
        // $data['periode'] = Skps::periode();
        return view(
            'skps/index',
            $data
        );
    }

    public function create()
    {
        $users = User::all();
        $position = Position::all();
        $rankgroup = RankGroup::all();
        $periode = Periode::all();
        $unit = Unit::all();
        return view(
            'skps/form',
            [
                'url' => 'skps.store',
                'users' => $users,
                'position' => $position,
                'rankgroup' => $rankgroup,
                'periode' => $periode,
                'unit' => $unit,
            ]
        );
    }
    public function store(Request $request, Skps $skps)
    {
        // dd($request->all());
        $request->validate([
            'nip_rated'     => 'required',
            'periode_id'     => 'required',
            'rated_unit_id'     => 'required',
            'rated_position_id'     => 'required',
            'rated_rankgroup_id'     => 'required',
            'commitment'     => 'required',
            'discipline'     => 'required',
            'cooperation'     => 'required',
            'leadership'     => 'required',
            'integrity'     => 'required',
            'service_oriented'     => 'required',
            'objection_rated'     => 'required',
            'response_evaluator'     => 'required',
            'superior_decision'     => 'required',
            'recommendation'     => 'required',
            'start_date'     => 'required',
            'date_given_to_superiors'     => 'required',
            'evaluator_rankgroup_id'     => 'required',
            'nip_evaluator'     => 'required',
            'evaluator_unit_id'     => 'required',
            'evaluator_position_id'     => 'required',

        ]);
        $skps->nip_rated = $request->input('nip_rated');
        $skps->periode_id = $request->input('periode_id');
        $skps->rated_unit_id = $request->input('rated_unit_id');
        $skps->rated_position_id = $request->input('rated_position_id');
        $skps->rated_rankgroup_id = $request->input('rated_rankgroup_id');
        $skps->commitment = $request->input('commitment');
        $skps->discipline = $request->input('discipline');
        $skps->cooperation = $request->input('cooperation');
        $skps->leadership = $request->input('leadership');
        $skps->integrity = $request->input('integrity');
        $skps->service_oriented = $request->input('service_oriented');
        $skps->objection_rated = $request->input('objection_rated');
        $skps->response_evaluator = $request->input('response_evaluator');
        $skps->superior_decision = $request->input('superior_decision');
        $skps->recommendation = $request->input('recommendation');
        $skps->start_date = $request->input('start_date');
        $skps->date_given_to_superiors = $request->input('date_given_to_superiors');
        $skps->nip_evaluator = $request->input('nip_evaluator');
        $skps->evaluator_rankgroup_id = $request->input('evaluator_rankgroup_id');
        $skps->evaluator_unit_id = $request->input('evaluator_unit_id');
        $skps->evaluator_position_id = $request->input('evaluator_position_id');
        $skps->save();

        return redirect()
            ->route('skps')
            ->with('message', 'Data berhasil ditambahkan');
    }

    public function edit(Skps $skps)
    {
        $users = User::all();
        $position = Position::all();
        $rankgroup = RankGroup::all();
        $periode = Periode::all();
        $unit = Unit::all();
        return view(
            'skps/form',
            [
                'skps' => $skps,
                'url' => 'skps.update',
                'users' => $users,
                'position' => $position,
                'rankgroup' => $rankgroup,
                'periode' => $periode,
                'unit' => $unit,
            ]
        );
    }

    public function update(Request $request, Skps $skps)
    {
        $validator = Validator::make($request->all(), [
            'nip_rated'     => 'required',
            'periode_id'     => 'required',
            'rated_unit_id'     => 'required',
            'rated_position_id'     => 'required',
            'rated_rankgroup_id'     => 'required',
            'commitment'     => 'required',
            'discipline'     => 'required',
            'cooperation'     => 'required',
            'leadership'     => 'required',
            'integrity'     => 'required',
            'service_oriented'     => 'required',
            'objection_rated'     => 'required',
            'response_evaluator'     => 'required',
            'superior_decision'     => 'required',
            'recommendation'     => 'required',
            'start_date'     => 'required',
            'date_given_to_superiors'     => 'required',
            'evaluator_rankgroup_id'     => 'required',
            'nip_evaluator'     => 'required',
            'evaluator_unit_id'     => 'required',
            'evaluator_position_id'     => 'required',
        ]);
        if ($validator->fails()) {
            return redirect()
                ->route('skps.update', $skps->nip_rated)
                ->withErrors($validator)
                ->withInput();
        } else {
            $skps->nip_rated = $request->input('nip_rated');
            $skps->periode_id = $request->input('periode_id');
            $skps->rated_unit_id = $request->input('rated_unit_id');
            $skps->rated_position_id = $request->input('rated_position_id');
            $skps->rated_rankgroup_id = $request->input('rated_rankgroup_id');
            $skps->commitment = $request->input('commitment');
            $skps->discipline = $request->input('discipline');
            $skps->cooperation = $request->input('cooperation');
            $skps->leadership = $request->input('leadership');
            $skps->integrity = $request->input('integrity');
            $skps->service_oriented = $request->input('service_oriented');
            $skps->objection_rated = $request->input('objection_rated');
            $skps->response_evaluator = $request->input('response_evaluator');
            $skps->superior_decision = $request->input('superior_decision');
            $skps->recommendation = $request->input('recommendation');
            $skps->start_date = $request->input('start_date');
            $skps->date_given_to_superiors = $request->input('date_given_to_superiors');
            $skps->nip_evaluator = $request->input('nip_evaluator');
            $skps->evaluator_rankgroup_id = $request->input('evaluator_rankgroup_id');
            $skps->evaluator_unit_id = $request->input('evaluator_unit_id');
            $skps->evaluator_position_id = $request->input('evaluator_position_id');
            $skps->save();

            return redirect()
                ->route('skps')
                ->with('message', 'Data berhasil diedit');
        }
    }

    public function destroy(Skps $skps)
    {
        $skps->forceDelete();
        return redirect()
            ->route('skps')
            ->with('message', 'Data berhasil dihapus');
    }

    public function cetak()
    {
        $id = request()->get('id');
        // dd($id);
        $data['user'] = Skps::user_name()->where('nip_rated','=',$id)->get();
        $data['data'] = Skps::user_name()->where('nip_rated','=',$id)->first();
        return view(
            'skps/cetak',
            $data
        );
    }
}
