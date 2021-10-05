<?php

namespace App\Http\Controllers;

use App\Target;
use App\User;
use App\Periode;
use App\Output;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class TargetController extends Controller
{


    public function index()
    {
        // $target = DB::table('targets')->get();
        // // dd($target);
        // $id = $target->id;
        // dd($id);
        // DB::table('targets')->update([
        //     'Parent_id' => $id
        // ]);
        $data['user'] = Target::target();
        return view(
            'target/index',
            $data
        );
    }

    public function create()
    {
        $users = User::all();
        $periode = Periode::all();
        $output = Output::all();
        return view(
            'target/form',
            [
                'url' => 'target.store',
                'users' => $users,
                'periode' => $periode,
                'output' => $output,


            ]
        );
    }
    public function store(Request $request, target $target)
    {
        // dd($request->all());
        $request->validate([
            'activities'     => 'required',
            'credit_number'     => 'required',
            'ak'     => 'required',
            'quantity'     => 'required',
            'output_id'     => 'required',
            'mutu'     => 'required',
            'time'     => 'required',
            'cost'     => 'required',
            'nip_rated'     => 'required',
            'periode_id'     => 'required',
            'type'     => 'required',

        ]);
        $target->activities = $request->input('activities');
        $target->credit_number = $request->input('credit_number');
        $target->ak = $request->input('ak');
        $target->quantity = $request->input('quantity');
        $target->output_id = $request->input('output_id');
        $target->mutu = $request->input('mutu');
        $target->time = $request->input('time');
        $target->cost = $request->input('cost');
        $target->nip_rated = $request->input('nip_rated');
        $target->periode_id = $request->input('periode_id');
        $target->type = $request->input('type');

        $target->save();

        return redirect()
            ->route('target')
            ->with('message', 'Data berhasil ditambahkan');
    }

    public function edit(Target $target)
    {
        $users = User::all();
        $periode = Periode::all();
        $output = Output::all();

        return view(
            'target/form',
            [
                'url' => 'target.update',
                'users' => $users,
                'periode' => $periode,
                'output' => $output,
                'target' => $target

            ]
        );
    }

    public function update(Request $request, Target $target)
    {
        $validator = Validator::make($request->all(), [
            'activities'     => 'required',
            'credit_number'     => 'required',
            'ak'     => 'required',
            'quantity'     => 'required',
            'output_id'     => 'required',
            'mutu'     => 'required',
            'time'     => 'required',
            'cost'     => 'required',
            'nip_rated'     => 'required',
            'periode_id'     => 'required',
            'type'     => 'required',

        ]);
        if ($validator->fails()) {
            return redirect()
                ->route('target.update', $target->id)
                ->withErrors($validator)
                ->withInput();
        } else {
            // dd($target->id);
            $target->activities = $request->input('activities');
            $target->credit_number = $request->input('credit_number');
            $target->ak = $request->input('ak');
            $target->quantity = $request->input('quantity');
            $target->output_id = $request->input('output_id');
            $target->mutu = $request->input('mutu');
            $target->time = $request->input('time');
            $target->cost = $request->input('cost');
            $target->nip_rated = $request->input('nip_rated');
            $target->periode_id = $request->input('periode_id');
            $target->type = $request->input('type');
            $target->Parent_id = $target->id;
            $target->save();

            return redirect()
                ->route('target')
                ->with('message', 'Data berhasil diedit');
        }
    }

    public function destroy(Target $target)
    {
        $id = $target->id;
        DB::table('realiations')->where('id', $id)->delete();
        $target->forceDelete();
        return redirect()
            ->route('target')
            ->with('message', 'Data berhasil dihapus');
    }

    // public function index()
    // {
    //     //load data
    //     $targets = Target::all();
    //     //buka halaman dan kirim data, kirim data = compact
    //     return view('targettahunan.index', compact('targets'));
    // }

    // public function create()
    // {
    //     $targets = Target::pluck('activities', 'id');
    //     $outputs = Output::pluck('name', 'id');
    //     $periode = Periode::select(DB::raw("concat(start_date,' s/d ',finish_date) as date"))->get()->pluck('date', 'id');
    //     return view('targettahunan.create', compact('targets', 'outputs', 'periode'));
    // }

    // public function store(Request $request)
    // {
    //     dd($request->all());
    //     $request->validate([
    //         'activities' => 'required',
    //         'credit_number' => 'required',
    //         'quantity' => 'required',
    //         'ak' => 'required',
    //         'output_id' => 'required',
    //         'mutu' => 'required',
    //         'time' => 'required',
    //         'cost' => 'required',
    //         'activities' => 'required',
    //         'credit_number' => 'required',
    //         'type' => 'required',


    //     ]);
    //     Target::create([
    //         $ak = "asda",
    //         'activities' => $request->activities,
    //         'credit_number' => $request->credit_number,
    //         'ak' => $ak,
    //         'quantity' => $request->quantity,
    //         'output_id' => $request->output_id,
    //         'mutu' => $request->mutu,
    //         'time' => $request->time,
    //         'cost' => $request->cost,
    //         'activities' => $request->activities,
    //         'credit_number' => $request->credit_number,
    //         'type' => $request->type,
    //         'Parent_id' => $request->Parent_id
    //     ]);
    //     return redirect()->route('targettahunan.index');
    // }

    // public function show($id)
    // {
    //     //
    // }

    // public function edit($id)
    // {
    //     $targets = Target::find($id);
    //     $outputs = Output::pluck('name', 'id');
    //     $users = User::pluck('nip');
    //     $periode = Periode::pluck('start_date', 'id');
    //     return view('targettahunan.create', compact('targets', 'outputs', 'users', 'periode'));
    //     return view('targettahunan.edit', compact('targets'));
    // }

    // public function update(Request $request, $id)
    // {
    //     $request->validate([
    //         'activities' => 'required',
    //         'credit_number' => 'required',
    //         'quantity' => 'required',
    //         'output_id' => 'required',
    //         'mutu' => 'required',
    //         'time' => 'required',
    //         'cost' => 'required',
    //         'activities' => 'required',
    //         'credit_number' => 'required',
    //         'type' => 'required',
    //         'Parent_id' => 'required'
    //     ]);
    //     $targets = Target::find($id);
    //     $targets->update([
    //         'activities' => $request->activities,
    //         'credit_number' => $request->credit_number,
    //         'quantity' => $request->quantity,
    //         'output_id' => $request->output_id,
    //         'mutu' => $request->mutu,
    //         'time' => $request->time,
    //         'cost' => $request->cost,
    //         'activities' => $request->activities,
    //         'credit_number' => $request->credit_number,
    //         'type' => $request->type,
    //         'Parent_id' => $request->Parent_id
    //     ]);
    //     return redirect()->route('targettahunan.index');
    // }

    // public function destroy($id)
    // {
    //     $targets = Target::find($id);
    //     $targets->delete();

    //     return redirect()->route('targettahunan.index');
    // }
}
