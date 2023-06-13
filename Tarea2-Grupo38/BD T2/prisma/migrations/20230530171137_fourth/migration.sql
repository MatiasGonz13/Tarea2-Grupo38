/*
  Warnings:

  - You are about to drop the column `tiempo_de_uso` on the `Defensas_en_reinos` table. All the data in the column will be lost.
  - Added the required column `meses_de_uso` to the `Defensas_en_reinos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Defensas_en_reinos" DROP COLUMN "tiempo_de_uso",
ADD COLUMN     "meses_de_uso" INTEGER NOT NULL;
