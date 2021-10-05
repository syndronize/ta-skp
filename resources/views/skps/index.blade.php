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
                                <a href="{{route('skps.create')}}" class="btn btn-primary">Tambah Data</a>
                                {{-- rubah href seleai --}}
                            </div>
                        </div>
                    </h5>
                    <div class="card-body">
                        <table class="table table-responsive table-striped">
                            <thead>
                                {{-- rubah mulai --}}
                                <tr>
                                    <th class="text-center">No</th>
                                    <th class="text-center">Nama Dinilai</th>
                                    <th class="text-center">Tanggal Mulai s/d Tanggal Selesai</th>
                                    <th class="text-center">Jabatan Dinilai</th>
                                    <th class="text-center">Pangkat Golongan Dinilai</th>
                                    <th class="text-center">Unit Dinilai</th>
                                    <th class="text-center">Komitmen</th>
                                    <th class="text-center">Disiplin</th>
                                    <th class="text-center">Kerja Sama</th>
                                    <th class="text-center">Kepemimpinan</th>
                                    <th class="text-center">Integritas</th>
                                    <th class="text-center">Orientasi Pelayanan</th>
                                    <th class="text-center">Keberatan Dinilai</th>
                                    <th class="text-center">Keberatan Penilai</th>
                                    <th class="text-center">Keputusan Atasan</th>
                                    <th class="text-center">Rekomendasi</th>
                                    <th class="text-center">Tanggal Selesai</th>
                                    <th class="text-center">Tanggal Diberikan Keatasan</th>
                                    <th class="text-center">Nama Penilai</th>
                                    <th class="text-center">Jabatan Penilai</th>
                                    <th class="text-center">Pangkat Golongan Penilai</th>
                                    <th class="text-center">Unit Penilai</th>
                                    <th class="text-center">Aksi</th>
                                </tr>
                                {{-- rubah selesai --}}
                            </thead>
                            <tbody>
                                @foreach ($user as $data)
                                <tr>
                                    <td class="text-center">{{ $loop->iteration }}</td>
                                    <td class="text-center">{{ $data->dinilai }}</td>
                                    <td class="text-center">{!!\Carbon\Carbon::parse($data->tgl_mulai)->isoFormat('D MMMM Y') .' <br> s/d <br>'. \Carbon\Carbon::parse($data->tgl_selesai)->isoFormat('D MMMM Y')!!}</td>
                                    <td class="text-center">{{ $data->posisi_dinilai }}</td>
                                    <td class="text-center">{{ $data->panggol_dinilai }}</td>
                                    <td class="text-center">{{ $data->unit_dinilai }}</td>
                                    <td class="text-center">{{ $data->commitment }}</td>
                                    <td class="text-center">{{ $data->discipline }}</td>
                                    <td class="text-center">{{ $data->cooperation }}</td>
                                    <td class="text-center">{{ $data->leadership }}</td>
                                    <td class="text-center">{{ $data->integrity }}</td>
                                    <td class="text-center">{{ $data->service_oriented }}</td>
                                    <td class="text-center">{{ $data->objection_rated }}</td>
                                    <td class="text-center">{{ $data->response_evaluator }}</td>
                                    <td class="text-center">{{ $data->superior_decision }}</td>
                                    <td class="text-center">{{ $data->recommendation }}</td>
                                    <td class="text-center">{{ $data->start_date }}</td>
                                    <td class="text-center">{{ $data->date_given_to_superiors }}</td>
                                    <td class="text-center">{{ $data->penilai }}</td>
                                    <td class="text-center">{{ $data->posisi_penilai }}</td>
                                    <td class="text-center">{{ $data->panggol_penilai }}</td>
                                    <td class="text-center">{{ $data->unit_penilai }}</td>
                                    <td class="text-center">
                                        <a href="{{ route('skps.edit',$data->nip_rated) }}" class="btn btn-warning" id="editButton" data-target="#editPegawai">
                                            <i class="cil-pencil"></i>
                                        </a>
                                        <a href="{{route('skps.cetak')}}?id={{$data->nip_rated}} " target="#" class="btn btn-primary">
                                            <i class="cil-print"></i>
                                        </a>
                                        <form action="{{ route('skps.destroy', $data->nip_rated) }}" method="post" onclick="return confirm('Anda yakin menghapus data ?')" class="d-inline">
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
