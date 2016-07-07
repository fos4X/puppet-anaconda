define conda::pinned(
    $pins = []
){
    require conda
    include conda::params

    file { "${conda::params::install_dir}/conda-meta/pinned":
        content => template('conda/pinned.erb'),
    } ->  Package <| provider == conda or provider == conda_pip |>
}
