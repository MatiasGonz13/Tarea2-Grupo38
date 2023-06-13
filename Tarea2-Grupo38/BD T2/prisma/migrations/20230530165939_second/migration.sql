/*
  Warnings:

  - You are about to drop the column `tiene` on the `Defenesas_en_reinos` table. All the data in the column will be lost.
  - Added the required column `tiempo_de_uso` to the `Defenesas_en_reinos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Defenesas_en_reinos" DROP COLUMN "tiene",
ADD COLUMN     "tiempo_de_uso" INTEGER NOT NULL;
