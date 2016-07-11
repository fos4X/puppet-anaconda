define conda::pinned(
    $pins = [],
    $env = undef,
){
    require conda
    include conda::params

    if $env {
        $filename = "${conda::params::install_dir}/envs/${env}/conda-meta/pinned"
    } else {
        $filename = "${conda::params::install_dir}/conda-meta/pinned"
    }

    file { $filename:
        content => template('conda/pinned.erb'),
    } ->  Package <| provider == conda or provider == conda_pip |>
}
