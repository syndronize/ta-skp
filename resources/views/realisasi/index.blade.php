@extends('layouts.app')

@section('content')
<div class="container-fluid">

    <div class="fade-in">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <h5>
                        <div class="card-header">
                            <div class="d-flex">
                                {{-- rubah href mulai --}}
                                <a href="{{route('realiation.create')}}" class="btn btn-primary">Tambah Data</a>
                                {{-- rubah href seleai --}}
                            </div>
                        </div>
                    </h5>
                    <div class="card-body col-lg-12">
                        <table class="table  table-striped ">
                            <thead>
                                {{-- rubah mulai --}}
                                <tr>
                                    <th class="text-center">No</th>
                                    <th class="text-center">Kuantitas</th>
                                    <th class="text-center">Kredit</th>
                                    <th class="text-center">Mutu</th>
                                    <th class="text-center">Biaya</th>
                                    <th class="text-center">Waktu</th>
                                    <th class="text-center">Aksi</th>
                                </tr>
                                {{-- rubah selesai --}}
                            </thead>
                            <tbody>
                                @foreach ($target as $data)
                                <tr>
                                    <td class="text-center">{{ $loop->iteration }}</td>
                                    <td class="text-center">{{ $data->quantity }}</td>
                                    <td class="text-center">{{ $data->credit_number }}</td>
                                    <td class="text-center">{{ $data->mututarget }}</td>
                                    <td class="text-center">{{ $data->costtarget }}</td>
                                    <td class="text-center">{{ $data->timetarget }}</td>
                                    <td class="text-center">
                                        <a href="{{ route('realiation.edit',$data->id) }}" class="btn btn-warning" id="editButton" data-target="#editPegawai">
                                            <i class="cil-pencil"></i>
                                        </a>
                                        <form action="{{ route('realiation.destroy', $data->id) }}" method="post" onclick="return confirm('Anda yakin menghapus data ?')" class="d-inline">
                                            @csrf
                                            @method('DELETE')
                                            <button class="btn btn-youtube">
                                                <i class="cil-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
