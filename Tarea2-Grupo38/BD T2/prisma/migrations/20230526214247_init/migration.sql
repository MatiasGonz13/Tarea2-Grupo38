-- CreateTable
CREATE TABLE "Personajes" (
    "id" SERIAL NOT NULL,
    "nombre" VARCHAR(45) NOT NULL,
    "fuerza" INTEGER NOT NULL,
    "fecha_nacimiento" DATE NOT NULL,
    "objeto" VARCHAR(30),

    CONSTRAINT "Personajes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Karts" (
    "id" SERIAL NOT NULL,
    "modelo" VARCHAR(45) NOT NULL,
    "color" VARCHAR(45) NOT NULL,
    "velocidad_maxima" INTEGER,
    "id_personaje" INTEGER NOT NULL,

    CONSTRAINT "Karts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Trabajos" (
    "id" SERIAL NOT NULL,
    "descripcion" VARCHAR(45),
    "sueldo" INTEGER NOT NULL,

    CONSTRAINT "Trabajos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Personaje_tiene_trabajo" (
    "id_trabajo" INTEGER NOT NULL,
    "id_personaje" INTEGER NOT NULL,
    "fecha_inicio" DATE NOT NULL,
    "fecha_termino" DATE,

    CONSTRAINT "Personaje_tiene_trabajo_pkey" PRIMARY KEY ("id_trabajo","id_personaje")
);

-- CreateTable
CREATE TABLE "Defensas" (
    "id" SERIAL NOT NULL,
    "defensa" VARCHAR(45) NOT NULL,

    CONSTRAINT "Defensas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Reinos" (
    "id" SERIAL NOT NULL,
    "nombre" VARCHAR(45) NOT NULL,
    "ubicacion" VARCHAR(45) NOT NULL,
    "superficie" INTEGER NOT NULL,

    CONSTRAINT "Reinos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Defenesas_en_reinos" (
    "id_reino" INTEGER NOT NULL,
    "id_defensa" INTEGER NOT NULL,

    CONSTRAINT "Defenesas_en_reinos_pkey" PRIMARY KEY ("id_reino","id_defensa")
);

-- CreateTable
CREATE TABLE "Diplomacias" (
    "id_reino_1" INTEGER NOT NULL,
    "id_reino_2" INTEGER NOT NULL,
    "es_aliado" BOOLEAN NOT NULL,

    CONSTRAINT "Diplomacias_pkey" PRIMARY KEY ("id_reino_1","id_reino_2")
);

-- CreateTable
CREATE TABLE "Personaje_habita_reino" (
    "id_personaje" INTEGER NOT NULL,
    "id_reino" INTEGER NOT NULL,
    "fecha_registro" TIMESTAMP NOT NULL,
    "es_gobernante" BOOLEAN NOT NULL,

    CONSTRAINT "Personaje_habita_reino_pkey" PRIMARY KEY ("id_personaje","id_reino")
);

-- AddForeignKey
ALTER TABLE "Karts" ADD CONSTRAINT "Karts_id_personaje_fkey" FOREIGN KEY ("id_personaje") REFERENCES "Personajes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Personaje_tiene_trabajo" ADD CONSTRAINT "Personaje_tiene_trabajo_id_trabajo_fkey" FOREIGN KEY ("id_trabajo") REFERENCES "Trabajos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Personaje_tiene_trabajo" ADD CONSTRAINT "Personaje_tiene_trabajo_id_personaje_fkey" FOREIGN KEY ("id_personaje") REFERENCES "Personajes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Defenesas_en_reinos" ADD CONSTRAINT "Defenesas_en_reinos_id_reino_fkey" FOREIGN KEY ("id_reino") REFERENCES "Reinos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Defenesas_en_reinos" ADD CONSTRAINT "Defenesas_en_reinos_id_defensa_fkey" FOREIGN KEY ("id_defensa") REFERENCES "Defensas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Diplomacias" ADD CONSTRAINT "Diplomacias_id_reino_1_fkey" FOREIGN KEY ("id_reino_1") REFERENCES "Reinos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Diplomacias" ADD CONSTRAINT "Diplomacias_id_reino_2_fkey" FOREIGN KEY ("id_reino_2") REFERENCES "Reinos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Personaje_habita_reino" ADD CONSTRAINT "Personaje_habita_reino_id_personaje_fkey" FOREIGN KEY ("id_personaje") REFERENCES "Personajes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Personaje_habita_reino" ADD CONSTRAINT "Personaje_habita_reino_id_reino_fkey" FOREIGN KEY ("id_reino") REFERENCES "Reinos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
