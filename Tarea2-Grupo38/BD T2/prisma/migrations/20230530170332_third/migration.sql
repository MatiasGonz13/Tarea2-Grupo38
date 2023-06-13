/*
  Warnings:

  - You are about to drop the `Defenesas_en_reinos` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Defenesas_en_reinos" DROP CONSTRAINT "Defenesas_en_reinos_id_defensa_fkey";

-- DropForeignKey
ALTER TABLE "Defenesas_en_reinos" DROP CONSTRAINT "Defenesas_en_reinos_id_reino_fkey";

-- DropTable
DROP TABLE "Defenesas_en_reinos";

-- CreateTable
CREATE TABLE "Defensas_en_reinos" (
    "id_reino" INTEGER NOT NULL,
    "id_defensa" INTEGER NOT NULL,
    "tiempo_de_uso" INTEGER NOT NULL,

    CONSTRAINT "Defensas_en_reinos_pkey" PRIMARY KEY ("id_reino","id_defensa")
);

-- AddForeignKey
ALTER TABLE "Defensas_en_reinos" ADD CONSTRAINT "Defensas_en_reinos_id_reino_fkey" FOREIGN KEY ("id_reino") REFERENCES "Reinos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Defensas_en_reinos" ADD CONSTRAINT "Defensas_en_reinos_id_defensa_fkey" FOREIGN KEY ("id_defensa") REFERENCES "Defensas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
