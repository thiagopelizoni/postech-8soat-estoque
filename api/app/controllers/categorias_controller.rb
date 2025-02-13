class CategoriasController < ApplicationController
  before_action :set_categoria, only: %i[ show update destroy ]

  # GET /categorias
  def index
    @categorias = Categoria.all.page(params[:page]).per(params[:per_page])

    render json: @categorias
  end

  # GET /categorias/:slug
  def show
    render json: @categoria, include_produtos: true
  end

  # POST /categorias
  def create
    @categoria = Categoria.new(categoria_params)

    if @categoria.save
      render json: @categoria, status: :created, location: @categoria
    else
      render json: @categoria.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categorias/:slug
  def update
    if @categoria.update(categoria_params)
      render json: @categoria
    else
      render json: @categoria.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categorias/:slug
  def destroy
    render json: { message: 'Não é permitido excluir uma categoria!' }
  end

  private
  def set_categoria
    @categoria = Categoria.find_by!(slug: params[:slug])
  end

  def categoria_params
    params.require(:categoria).permit(:nome)
  end
end
